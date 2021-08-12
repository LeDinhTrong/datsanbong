import 'package:field_for_rent/blocs/b700_footbalfield_bloc.dart';
import 'package:field_for_rent/blocs/b900_imagefield_bloc.dart';
import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/models/m900_imagefield_model.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/booking.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FieldDetail extends StatefulWidget {
  final int idField;
  FieldDetail({required this.idField});

  @override
  _FieldDetailState createState() => _FieldDetailState();
}

class _FieldDetailState extends State<FieldDetail> {
  final _fieldBloc = FootbalFieldBloc();
  final _imgBloc = ImageFieldBloc();
  M700FootbalFieldModel? _fieldModel;
  List<M900ImageFieldModel> _imgList = [];

  @override
  void initState() {
    super.initState();
    listent();
  }

  @override
  void dispose() {
    super.dispose();
    _fieldBloc.dispose();
  }

  listent() {
    _fieldBloc.footbalFieldStream704.listen((event) {
      _fieldModel = event.first;
    });
    _imgBloc.imageFieldStream907.listen((event) {
      _imgList = event;
    });
    _init();
  }

  _init() async {
    _fieldBloc.callWhat704(widget.idField);
    _imgBloc.callWhat907(widget.idField);
  }

  Widget _imageField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _imgList.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("${_imgList[i].Img_Url}")),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: _fieldBloc.footbalFieldStream704,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.length > 0
              ? Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(
                      "${_fieldModel!.Name}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${_fieldModel!.Avatar_Url}"),
                                    fit: BoxFit.cover)),
                          )),
                      Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${_fieldModel!.Name}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  Text(
                                    "${_fieldModel!.Description}",
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  Row(
                                    children: [
                                      FakeTextSpan(
                                          text1: "Start: ",
                                          text2:
                                              "${convertDate("${_fieldModel!.OpenAt}")} h"),
                                      FakeTextSpan(
                                          text1: " to: ",
                                          text2:
                                              "${convertDate("${_fieldModel!.CloseAt}")} h"),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Row(
                                    children: [
                                      Text(
                                        "Telephone Number: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          launch("tel:0322564588");
                                        },
                                        child: Text(
                                          "0322564588",
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  FakeTextSpan(
                                      text1: "Address: ",
                                      text2: "${_fieldModel!.Address}"),
                                  _imageField(),
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Price: ",
                                      style: TextStyle(
                                          color: kPrimaryColor, fontSize: 20),
                                    ),
                                    Text(
                                      "${_fieldModel!.Price_Per_Hour}" +
                                          " vnd/h",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 150,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  kPrimaryColor),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  kPrimaryColor),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookingPage(
                                                        fieldId: widget.idField,
                                                      )));
                                        },
                                        child: Text(
                                          "Booking",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: Text("Emty"));
        }
        if (snapshot.hasError) {
          Center(child: Text("Error"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
