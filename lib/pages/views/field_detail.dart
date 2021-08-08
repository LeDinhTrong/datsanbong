import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/models/m900_imagefield_model.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/booking.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FieldDetail extends StatefulWidget {
  final String idField;
  FieldDetail({required this.idField});

  @override
  _FieldDetailState createState() => _FieldDetailState();
}

class _FieldDetailState extends State<FieldDetail> {
  Future<Map<String, dynamic>> getImg(String j) async {
    Map<String, dynamic> data = {};
    final _repo = Repository();
    data["img"] =
        await _repo.r900ImageFieldProvider.p900ImageField(907, {'Field_Id': j});
    data["field"] =
        await _repo.r700FootbalFieldProvider.p700FootbalField(704, {'id': j});
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: getImg(widget.idField.toString()),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<M900ImageFieldModel> imgData = snapshot.data["img"];
          List<M700FootbalFieldModel> fieldData = snapshot.data["field"];
          M700FootbalFieldModel? fieldModel;
          for (var i = 0; i < fieldData.length; i++) {
            fieldModel = fieldData[i];
          }
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                fieldModel!.Name.toString(),
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
                              image:
                                  AssetImage(fieldModel.Avatar_Url.toString()),
                              fit: BoxFit.cover)),
                    )),
                Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Column(
                        children: [
                          Text(
                            fieldModel.Name.toString(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Text(
                            fieldModel.Description.toString(),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            children: [
                              Text("Telephone Number: "),
                              InkWell(
                                onTap: () async {
                                  launch("tel:0322564588");
                                },
                                child: Text(
                                  "0322564588",
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              FakeTextSpan(
                                  text1: "Start: ",
                                  text2:
                                      "${convertDate(fieldModel.OpenAt.toString())} h"),
                              FakeTextSpan(
                                  text1: " to: ",
                                  text2:
                                      "${convertDate(fieldModel.CloseAt.toString())} h"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            height: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imgData.length,
                                itemBuilder: (context, i) {
                                  M900ImageFieldModel imgModel = imgData[i];
                                  // var item = fieldList[widget.index].imgUrl;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child:
                                            Image.asset("${imgModel.Img_Url}")),
                                  );
                                }),
                          ),
                        ],
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
                                fieldModel.Price_Per_Hour.toString() + " vnd/h",
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
                                            builder: (context) => BookingPage(
                                                  fieldId: widget.idField,
                                                )));
                                  },
                                  child: Text(
                                    "Booking",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
