import 'package:field_for_rent/models/m500_user_model.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/models/field_model.dart';
import 'package:field_for_rent/pages/views/account_page.dart';
import 'package:field_for_rent/pages/views/field_detail.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> getData() async {
  Map<String, dynamic> data = {};
  final _repo = Repository();
  data["user"] = await _repo.r500UserProvider.p500User(500, {});
  data["field"] =
      await _repo.r700FootbalFieldProvider.p700FootbalField(700, {});

  return data;
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF6F6F9),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<M500UserModel> userData = snapshot.data["user"];
            List<M700FootbalFieldModel> fieldData = snapshot.data["field"];
            M500UserModel? userModel;
            for (var i = 0; i < userData.length; i++) {
              userModel = userData[i];
            }
            return Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
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
                                            color: Colors.white,
                                            size: size.height * 0.04,
                                          )),
                                      Text(
                                        "${userModel!.Name}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
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
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/img_header.png",
                                  height: size.height * 0.16,
                                ),
                                SizedBox(height: size.height * 0.02),
                                Text(
                                  "Let's Play",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25),
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
                            ),
                          ],
                        ))),
                Expanded(
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
                        child: ListView.builder(
                            itemCount: fieldData.length,
                            itemBuilder: (BuildContext context, int index) {
                              M700FootbalFieldModel? fieldModel =
                                  fieldData[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FieldDetail(
                                                idField:
                                                    fieldModel.id.toString(),
                                              )));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            fieldModel.Name.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          FakeTextSpan(
                                              text1: "Distance: ",
                                              text2:
                                                  "${fieldList[index].distance.toString()} km"),
                                          FakeTextSpan(
                                              text1: "Price: ",
                                              text2: fieldModel.Price_Per_Hour
                                                      .toString() +
                                                  " vnd/h"),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          height: 110,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                                image: AssetImage(fieldModel
                                                    .Avatar_Url.toString()),
                                                fit: BoxFit.cover),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ]),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
