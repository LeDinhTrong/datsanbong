import 'package:field_for_rent/blocs/b700_footbalfield_bloc.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/pages/components/search_bar.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/views/distance/calcu_distance/distance_model.dart';
import 'package:field_for_rent/pages/views/distance/calcu_distance/repositories.dart';
import 'package:field_for_rent/pages/views/distance/location_field/location_model.dart';
import 'package:field_for_rent/pages/views/distance/location_field/repositories.dart';
import 'package:field_for_rent/pages/views/field_detail.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class FieldPage extends StatefulWidget {
  FieldPage({Key? key}) : super(key: key);

  @override
  _FieldPageState createState() => _FieldPageState();
}

class _FieldPageState extends State<FieldPage> {
  final _fieldBloc = FootbalFieldBloc();
  final _repo = Repo();
  final _reposi = Reposi();
  String query = '';
  var startLat;
  var startLng;
  var destinationLat;
  var destinationLng;
  var distanceCal;
  List distanceList = [];
  List<M700FootbalFieldModel>? _fieldModel;
  List<M700FootbalFieldModel> _filterField = [];
  List<CardModel> _cardModel = [];

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
      _filterField = _fieldModel!;
      for (var i = 0; i < _fieldModel!.length; i++) {
        distanceList.add(i);
        getDistance(_fieldModel![i].Address!, i);
      }
    });
    _init();
  }

  _init() async {
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

  void searchFilter(String keyWord) {
    final filterSearch = _fieldModel!
        .where((element) =>
            element.Name!.toLowerCase().contains(keyWord.toLowerCase()))
        .toList();

    setState(() {
      this._filterField = filterSearch;
      this.query = keyWord;
    });
  }

  Widget buildSearch() =>
      SearchBar(text: query, onChanged: searchFilter, hintText: 'Search here');

  _header(Size size) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildSearch(),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose field",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
            ),
          ],
        ),
      ),
    );
  }

  _fieldInfomation(int i) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${_filterField[i].Name}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "${_filterField[i].Description}",
              style: TextStyle(color: Color(0xffC4C4C4)),
            ),
            Wrap(
              children: [
                FakeTextSpan(
                    text1: "Start: ",
                    text2:
                        "${convertDate(_filterField[i].OpenAt.toString())} h"),
                FakeTextSpan(
                    text1: " to: ",
                    text2:
                        "${convertDate(_filterField[i].CloseAt.toString())} h"),
              ],
            ),
            FakeTextSpan(
                text1: "Price: ", text2: "${_filterField[i].Price_Per_Hour}"),
            FakeTextSpan(
                text1: "Distance:  ",
                text2: '${distanceList.length > 0 ? distanceList[i] : 0}'),
          ],
        ),
      ),
    );
  }

  _body() {
    return StreamBuilder(
      stream: _fieldBloc.footbalFieldStream700,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          for (var i = 0; i < _fieldModel!.length; i++) {
            _cardModel.add(CardModel(
              _fieldModel![i].Name!,
              _fieldModel![i].Description!,
              _fieldModel![i].OpenAt!,
              _fieldModel![i].CloseAt!,
              _fieldModel![i].Price_Per_Hour!,
              distanceList[i].toString(),
            ));
            print(_cardModel.length);
            print(_cardModel);
            print("_cardModel.length");
          }
          return _filterField.length > 0
              ? Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                        itemCount: _filterField.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FieldDetail(
                                            idField: int.parse(
                                                _filterField[i].idField!),
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 180,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${_filterField[i].Avatar_Url}"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  _fieldInfomation(i),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              : Text("No results found");
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // distanceList.sort((a, b) => a.compareTo(b));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff6f6f9),
      body: SafeArea(
        child: Column(
          children: [
            _header(size),
            _body(),
          ],
        ),
      ),
    );
  }
}

class CardModel {
  String name;
  String description;
  String start;
  String to;
  String price;
  String distance;
  CardModel(this.name, this.description, this.start, this.to, this.price,
      this.distance);
}
