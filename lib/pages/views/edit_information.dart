import 'package:field_for_rent/pages/components/input_field.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:flutter/material.dart';

class EditInfor extends StatelessWidget {
  const EditInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameEditController = TextEditingController();
    TextEditingController _phoneEditController = TextEditingController();
    TextEditingController _emailEditController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                      size: size.height * 0.08,
                    ),
                    InputField(
                        controller: _nameEditController, hintText: "Name"),
                    InputField(
                        controller: _nameEditController, hintText: "Phone"),
                    InputField(
                        controller: _nameEditController, hintText: "Email"),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.07,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Done",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget EditForm(
      {required TextEditingController controller, required String hintText}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: kPrimaryColor),
        border: InputBorder.none,
      ),
    );
  }
}
