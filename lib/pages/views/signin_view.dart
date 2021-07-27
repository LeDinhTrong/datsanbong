import 'package:field_for_rent/pages/components/bottom_navigation_bar.dart';
import 'package:field_for_rent/pages/components/input_field.dart';
import 'package:field_for_rent/pages/components/or_divider.dart';
import 'package:field_for_rent/pages/components/password_field.dart';
import 'package:field_for_rent/pages/components/social_icon.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/signup_view.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xF6F6F9),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.04),
                  height: size.height * 0.27,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: kPrimaryColor),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/output-onlinepngtools.png"),
                      ))),
              Text(
                "Login to your account",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      InputField(
                        controller: emailController,
                        hintText: "Email",
                        validator: (emailController) {
                          if (emailController.isNotEmpty &&
                              emailController.contains("@")) {
                            return null;
                          } else if (emailController.isNotEmpty &&
                              emailController.contains("@")) {
                            return "Email is invalid";
                          } else {
                            return "Enter your email";
                          }
                        },
                      ),
                      PasswordField(
                        controller: passwordController,
                        hintText: "Password",
                        validator: (passwordController) {
                          if (passwordController.isNotEmpty &&
                              passwordController.length > 6) {
                            return null;
                          } else if (passwordController.isNotEmpty &&
                              passwordController.length < 7) {
                            return "Your password is short!!!";
                          } else {
                            return "Enter your password";
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
                      if (globalKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNaviBar()));
                      }
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              OrDivider(text: "Or Sign In With"),
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
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: kPrimaryLightColor, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
