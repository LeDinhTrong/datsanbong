import 'package:field_for_rent/blocs/b700_footbalfield_bloc.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/views/account_page.dart';
import 'package:field_for_rent/pages/views/distance/calcu_distance/distance_model.dart';
import 'package:field_for_rent/pages/views/distance/calcu_distance/repositories.dart';
import 'package:field_for_rent/pages/views/distance/location_field/location_model.dart';
import 'package:field_for_rent/pages/views/distance/location_field/repositories.dart';
import 'package:field_for_rent/pages/views/field_detail.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FieldPage extends StatefulWidget {
  FieldPage({Key? key}) : super(key: key);

  @override
  _FieldPageState createState() => _FieldPageState();
}

class _FieldPageState extends State<FieldPage> {
  SharedPreferences? _prefs;
  final _fieldBloc = FootbalFieldBloc();
  final _repo = Repo();
  final _reposi = Reposi();
  var startLat;
  var startLng;
  var destinationLat;
  var destinationLng;
  var distanceCal;
  List distanceList = [];
  List<M700FootbalFieldModel>? _fieldModel;

  @override
  void initState() {
    super.initState();
    listent();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _fieldBloc.dispose();
  }

  listent() {
    _fieldBloc.footbalFieldStream700.listen((event) async {
      _fieldModel = _fieldBloc.listFootbalField700;
      for (var i = 0; i < _fieldModel!.length; i++) {
        distanceList.add(i);
        getDistance(_fieldModel![i].Address!, i);
      }
    });
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
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
      print(distanceCal);

      setState(() {
        distanceList[i] = distanceCal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xfff6f6f9),
        body: SafeArea(
          child: StreamBuilder(
            stream: _fieldBloc.footbalFieldStream700,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.length > 0
                    ? Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 13),
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AccountPage()));
                                          },
                                          icon: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black,
                                            size: size.height * 0.04,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.search,
                                            color: Colors.black,
                                            size: size.height * 0.04,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.04),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Choose field",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.short_text_rounded,
                                            color: Colors.black,
                                            size: size.height * 0.04,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.04),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: ListView.builder(
                                    itemCount: _fieldModel!.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FieldDetail(
                                                        idField:
                                                            _fieldModel![i].id!,
                                                      )));
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  height: 180,
                                                  padding: EdgeInsets.all(7),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "${_fieldModel![i].Avatar_Url}"),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "${_fieldModel![i].Name}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        "${_fieldModel![i].Description}",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffC4C4C4)),
                                                      ),
                                                      Wrap(
                                                        children: [
                                                          FakeTextSpan(
                                                              text1: "Start: ",
                                                              text2:
                                                                  "${convertDate(_fieldModel![i].OpenAt.toString())} h"),
                                                          FakeTextSpan(
                                                              text1: " to: ",
                                                              text2:
                                                                  "${convertDate(_fieldModel![i].CloseAt.toString())} h"),
                                                        ],
                                                      ),
                                                      FakeTextSpan(
                                                          text1: "Price: ",
                                                          text2:
                                                              "${_fieldModel![i].Price_Per_Hour}"),
                                                      FakeTextSpan(
                                                          text1: "Distance:  ",
                                                          text2:
                                                              '${distanceList.length > 0 ? distanceList[i] : 0}'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )),
                        ],
                      )
                    : Container();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
