import 'package:field_for_rent/pages/components/input_field.dart';
import 'package:field_for_rent/pages/components/or_divider.dart';
import 'package:field_for_rent/pages/components/password_field.dart';
import 'package:field_for_rent/pages/components/social_icon.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/signin_view.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Create your account',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: size.height,
        width: size.width,
        color: Color(0xF6F6F9),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField(controller: nameController, hintText: "Name"),
              InputField(controller: phoneController, hintText: "Phone"),
              InputField(controller: emailController, hintText: "Email"),
              PasswordField(
                  controller: passwordController, hintText: "Password"),
              PasswordField(
                  controller: confirmPassController,
                  hintText: "Confirm Password"),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                width: size.width * 0.9,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              OrDivider(text: "Or Sign Up With"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                      iconSrc: "assets/icons/facebook.svg", onPress: () {}),
                  SocialIcon(
                      iconSrc: "assets/icons/twitter.svg", onPress: () {}),
                  SocialIcon(
                      iconSrc: "assets/icons/google-plus.svg", onPress: () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
