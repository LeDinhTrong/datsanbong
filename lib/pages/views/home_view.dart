import 'package:field_for_rent/blocs/b500_user_bloc.dart';
import 'package:field_for_rent/blocs/b700_footbalfield_bloc.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/pages/components/routes.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/account_page.dart';
import 'package:field_for_rent/pages/views/distance/calcu_distance/distance_model.dart';
import 'package:field_for_rent/pages/views/distance/calcu_distance/repositories.dart';
import 'package:field_for_rent/pages/views/distance/location_field/location_model.dart';
import 'package:field_for_rent/pages/views/distance/location_field/repositories.dart';
import 'package:field_for_rent/pages/views/field_detail.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userBloc = UserBloc();
  final _fieldBloc = FootbalFieldBloc();
  final _repo = Repo();
  final _reposi = Reposi();
  var startLat;
  var startLng;
  var destinationLat;
  var destinationLng;
  var distanceCal;
  SharedPreferences? _prefs;
  List distanceList = [];
  List<M700FootbalFieldModel>? _fieldModelList;

  @override
  void initState() {
    super.initState();
    listent();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.dispose();
    _fieldBloc.dispose();
  }

  listent() {
    _fieldBloc.footbalFieldStream700.listen((event) {
      _fieldModelList = event;
      for (var i = 0; i < _fieldModelList!.length; i++) {
        distanceList.add(i);
        getDistance(_fieldModelList![i].Address!, i);
      }
    });
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
    _userBloc.callWhat504(int.parse(_prefs!.getString('id')!));
    _fieldBloc.callWhat700();
  }

  getCurrentLocation() async {
    final currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    startLat = currentLocation.latitude;
    startLng = currentLocation.longitude;
  }

  getDistance(String address, int i) async {
    LocationModel locationModel;
    DistanceModel distanceModel;

    locationModel = await _repo.getApi(address);
    destinationLat = locationModel.result[0].location.lat;
    destinationLng = locationModel.result[0].location.lng;

    distanceModel = await _reposi.getApi(
        startLat, startLng, destinationLat, destinationLng);
    if (distanceModel.result.routes.length > 0) {
      distanceCal = distanceModel.result.routes[0].distance.text;
      setState(() {
        distanceList[i] = distanceCal;
      });
    }
  }

  _accountOnPress(BuildContext context) {
    return Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccountPage()))
        .then((value) {
      _userBloc.callWhat504(int.parse(_prefs!.getString('id')!));
    });
  }

  Widget _header(size, snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _accountOnPress(context);
                },
                child: Container(
                  width: size.width / 10,
                  height: size.width / 10,
                  margin: new EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("${snapshot.data.first.Avatar_Url}"))),
                ),
              ),
              Text(
                snapshot.data.first.Name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: size.height * 0.04,
            ))
      ],
    );
  }

  Widget _description(size) {
    return Column(
      children: [
        Image.asset(
          "assets/images/img_header.png",
          height: size.height * 0.16,
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          "Let's Play",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          "with your friends and let's play outdoor",
          style: TextStyle(color: Colors.white),
        ),
        Text(
          "and indoor fooball",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _banner(size) {
    return StreamBuilder(
      stream: _userBloc.userStream504,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
              flex: 2,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _header(size, snapshot),
                      _description(size),
                    ],
                  )));
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error load data"));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _listCard() {
    return ListView.builder(
        itemCount: _fieldModelList!.length,
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FieldDetail(
                          idField: int.parse(_fieldModelList![i].idField!))));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _fieldModelList![i].Name.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          FakeTextSpan(
                              text1: "Distance: ",
                              text2:
                                  '${distanceList.length > 0 ? distanceList[i] : 0}'),
                          FakeTextSpan(
                              text1: "Price: ",
                              text2: "${_fieldModelList![i].Price_Per_Hour}" +
                                  " vnd/h"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        height: 110,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "${_fieldModelList![i].Avatar_Url}"),
                              fit: BoxFit.cover),
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _body() {
    return StreamBuilder(
      stream: _fieldBloc.footbalFieldStream700,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        "Nearest Fields",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: _listCard(),
                )
              ]),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("Error load data!");
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF6F6F9),
      body: SafeArea(
        child: Column(
          children: [
            _banner(size),
            _body(),
          ],
        ),
      ),
    );
  }
}
