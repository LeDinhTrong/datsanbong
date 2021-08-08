import 'package:field_for_rent/pages/components/input_field.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditInfor extends StatefulWidget {
  EditInfor({Key? key}) : super(key: key);

  @override
  _EditInforState createState() => _EditInforState();
}

class _EditInforState extends State<EditInfor> {
  SharedPreferences? _prefs;
  TextEditingController _nameEditController = TextEditingController();
  TextEditingController _phoneEditController = TextEditingController();
  TextEditingController _emailEditController = TextEditingController();

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
          "Edit",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            controller: _phoneEditController,
                            hintText: "Phone"),
                        InputField(
                            controller: _emailEditController,
                            hintText: "Email"),
                      ],
                    ),
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
                    onPressed: () async {
                      _prefs = await SharedPreferences.getInstance();
                      final _repo = Repository();
                      await _repo.r500UserProvider.p500User(507, {
                        "id": int.parse(_prefs!.getString('id')!),
                        "Name": _nameEditController.text,
                        "Phone": _phoneEditController.text,
                        "Email": _emailEditController.text,
                      });
                      Navigator.pop(context, true);
                    },
                    child: Text("Done",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget editForm(
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
