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
  bool sort = false;
  final _fieldBloc = FootbalFieldBloc();
  final _repo = Repo();
  final _reposi = Reposi();
  String query = '';
  var startLat;
  var startLng;
  var destinationLat;
  var destinationLng;
  var distanceCal;
  List<M700FootbalFieldModel>? _fieldModel;
  List<CardModel> _filterField = [];
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
      _fieldModel = event;
      for (var i = 0; i < _fieldModel!.length; i++) {
        LocationModel locationModel;
        locationModel = await _repo.getApi(_fieldModel![i].Address!);
        destinationLat = locationModel.result[0].location.lat;
        destinationLng = locationModel.result[0].location.lng;

        DistanceModel distanceModel;
        distanceModel = await _reposi.getApi(
            startLat, startLng, destinationLat, destinationLng);
        distanceCal = distanceModel.result.routes[0].distance.text;

        _cardModel.add(CardModel(
          _fieldModel![i].idField!,
          _fieldModel![i].Name!,
          _fieldModel![i].Description!,
          _fieldModel![i].OpenAt!,
          _fieldModel![i].CloseAt!,
          _fieldModel![i].Price_Per_Hour!,
          distanceCal,
          _fieldModel![i].Avatar_Url!,
        ));

        // if (_filterField.length == _cardModel.length) {
        //   _filterField = _cardModel;
        // }
      }
      setState(() {
        _filterField = _cardModel;
      });
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

  void searchFilter(String keyWord) {
    final filterSearch = _cardModel
        .where((element) =>
            element.name.toLowerCase().contains(keyWord.toLowerCase()))
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
                      onPressed: () {
                        if (sort == false) {
                          setState(() {
                            sort = true;
                            _filterField.sort(
                                (a, b) => a.distance.compareTo(b.distance));
                          });
                        } else {
                          setState(() {
                            sort = false;
                            _filterField.sort(
                                (a, b) => b.distance.compareTo(a.distance));
                          });
                        }
                      },
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
              "${_filterField[i].name}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              "${_filterField[i].description}",
              style: TextStyle(color: Color(0xffC4C4C4)),
            ),
            Wrap(
              children: [
                FakeTextSpan(
                    text1: "Start: ",
                    text2:
                        "${convertDate(_filterField[i].start.toString())} h"),
                FakeTextSpan(
                    text1: " to: ",
                    text2: "${convertDate(_filterField[i].to.toString())} h"),
              ],
            ),
            FakeTextSpan(text1: "Price: ", text2: "${_filterField[i].price}"),
            FakeTextSpan(
                text1: "Distance:  ", text2: '${_filterField[i].distance}'),
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
          return Expanded(
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
                                      idField: int.parse(_filterField[i].id),
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
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${_filterField[i].avatar}"),
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
          );
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
  String id;
  String name;
  String description;
  String start;
  String to;
  String price;
  String distance;
  String avatar;
  CardModel(this.id, this.name, this.description, this.start, this.to,
      this.price, this.distance, this.avatar);
}
