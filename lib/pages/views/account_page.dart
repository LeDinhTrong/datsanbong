import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/models/user_mode.dart';
import 'package:field_for_rent/pages/views/edit_information.dart';
import 'package:field_for_rent/pages/views/signin_view.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditInfor()));
                    },
                    child:
                        Text("change", style: TextStyle(color: kPrimaryColor)))
              ],
            ),
            SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.white,
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                        size: size.height * 0.08,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InforAccount(
                                text1: "Name: ",
                                text2: "${userModelList[0].name}"),
                            InforAccount(
                                text1: "Your phone: ",
                                text2: "${userModelList[0].phone}"),
                            InforAccount(
                                text1: "Email: ",
                                text2: "${userModelList[0].email}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
                text: "Faq",
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPress: () {}),
            BottomButton(
                text: "Help",
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPress: () {}),
            BottomButton(
                text: "Sign Out",
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                }),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget InforAccount({required String text1, required String text2}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: text1,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
      TextSpan(text: text2, style: TextStyle(color: Colors.grey, fontSize: 18)),
    ]));
  }

  // ignore: non_constant_identifier_names
  Widget BottomButton(
      {required String text,
      required Icon icon,
      required VoidCallback onPress}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.white,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18)),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
