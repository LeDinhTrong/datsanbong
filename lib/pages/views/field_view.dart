import 'package:field_for_rent/method/formatted_date.dart';
import 'package:field_for_rent/models/m700_footbalfield_model.dart';
import 'package:field_for_rent/pages/components/text_span.dart';
import 'package:field_for_rent/pages/models/field_model.dart';
import 'package:field_for_rent/pages/views/account_page.dart';
import 'package:field_for_rent/pages/views/field_detail.dart';
import 'package:field_for_rent/pages/views/home_view.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';

// Future<Map<String, dynamic>> getField() async {
//   Map<String, dynamic> data = {};
//   final _repo = Repository();
//   data["field"] =
//       await _repo.r700FootbalFieldProvider.p700FootbalField(700, {});

//   return data;
// }

class FieldPage extends StatelessWidget {
  FieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xfff6f6f9),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<M700FootbalFieldModel> fieldData = snapshot.data["field"];
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 13),
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Choose field",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
                            itemCount: fieldData.length,
                            itemBuilder: (BuildContext context, int i) {
                              M700FootbalFieldModel fieldModel = fieldData[i];
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
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 170,
                                          padding: EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${fieldModel.Avatar_Url}"),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "${fieldModel.Name}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                "${fieldModel.Description}",
                                                style: TextStyle(
                                                    color: Color(0xffC4C4C4)),
                                              ),
                                              Wrap(
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
                                              FakeTextSpan(
                                                  text1: "Price: ",
                                                  text2:
                                                      "${fieldModel.Price_Per_Hour}"),
                                              FakeTextSpan(
                                                  text1: "Distance: ",
                                                  text2:
                                                      "${fieldList[i].distance.toString()}"),
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
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
