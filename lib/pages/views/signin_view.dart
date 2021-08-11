import 'dart:async';

import 'package:field_for_rent/blocs/login_bloc.dart';
import 'package:field_for_rent/method/validations.dart';
import 'package:field_for_rent/models/m500_user_model.dart';
import 'package:field_for_rent/pages/components/bottom_navigation_bar.dart';
import 'package:field_for_rent/pages/components/input_field.dart';
import 'package:field_for_rent/pages/components/or_divider.dart';
import 'package:field_for_rent/pages/components/password_field.dart';
import 'package:field_for_rent/pages/components/routes.dart';
import 'package:field_for_rent/pages/components/social_icon.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/signup_view.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _repository = Repository();
  final _loginBloc = LoginBloc();
  final globalKey = GlobalKey<FormState>();
  bool isLogin = false;
  SharedPreferences? prefs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  void _login(BuildContext context) async {
    Map<String, dynamic> param = {};
    param['Email'] = emailController.text.trim();
    param['Password'] = passwordController.text.trim();

    await _repository.r500UserProvider.p500User(508, param).then((value) async {
      print("52 test ${value.first}");
      prefs = await SharedPreferences.getInstance();
      print(prefs!.getString('access_token'));
      await prefs!.setString('id', value.first.id);
      if (value.length != 0) {
        Navigator.pushNamed(context, navibarRoute);

        EasyLoading.showSuccess('Login Succsess!');
      } else {
        EasyLoading.showError('The email or password is incorrect');
      }
    }).catchError((error, stackTrace) {
      print("loi");
      EasyLoading.showError("The email or password is incorrect");
    });
  }

  builEmailFormField(snapshot) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        Validations.validateEmail(value!);
      },
      onChanged: (value) {
        _loginBloc.setEmail(value);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        errorText: snapshot.hasError ? snapshot.error : null,
        hintText: "Email",
        hintStyle: TextStyle(color: kPrimaryColor),
        border: InputBorder.none,
      ),
    );
  }

  buiPasswordFormField(snapshot) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        Validations.validatePassword(value!);
      },
      onChanged: (value) {
        _loginBloc.setPass(value);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        errorText: snapshot.hasError ? snapshot.error : null,
        hintText: "Password",
        hintStyle: TextStyle(color: kPrimaryColor),
        border: InputBorder.none,
      ),
    );
  }

  Widget _socialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(iconSrc: "assets/icons/facebook.svg", onPress: () {}),
        SocialIcon(iconSrc: "assets/icons/twitter.svg", onPress: () {}),
        SocialIcon(iconSrc: "assets/icons/google-plus.svg", onPress: () {})
      ],
    );
  }

  Widget _chooseSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupPage()));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: kPrimaryLightColor, fontSize: 16),
          ),
        )
      ],
    );
  }

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
                      StreamBuilder(
                          stream: _loginBloc.email,
                          builder: (context, AsyncSnapshot snapshot) {
                            return builEmailFormField(snapshot);
                          }),
                      SizedBox(height: size.height * 0.02),
                      StreamBuilder(
                          stream: _loginBloc.password,
                          builder: (context, AsyncSnapshot snapshot) {
                            return buiPasswordFormField(snapshot);
                          }),
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
                      _login(context);
                      // if (globalKey.currentState!.validate()) {

                      // }
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              OrDivider(text: "Or Sign In With"),
              _socialMedia(),
              SizedBox(height: size.height * 0.02),
              _chooseSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
