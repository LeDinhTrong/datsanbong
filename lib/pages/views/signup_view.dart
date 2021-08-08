import 'package:field_for_rent/blocs/register_bloc.dart';
import 'package:field_for_rent/pages/components/input_field.dart';
import 'package:field_for_rent/pages/components/or_divider.dart';
import 'package:field_for_rent/pages/components/password_field.dart';
import 'package:field_for_rent/pages/components/social_icon.dart';
import 'package:field_for_rent/pages/constants.dart';
import 'package:field_for_rent/pages/views/signin_view.dart';
import 'package:field_for_rent/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _registerBloc = RegisterBloc();
  final _repo = Repository();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _registerBloc.dispose();
  }

  _signUp(BuildContext context) async {
    Map<String, dynamic> param = {};
    param["Name"] = _nameController.text.trim();
    param["Phone"] = _phoneController.text.trim();
    param["Email"] = _emailController.text.trim();
    param["Password"] = _passwordController.text.trim();
    param["Avatar_Url"] = "";

    if (_registerBloc.isValidEmail(_emailController.text) == true &&
        _registerBloc.isValidConfirmPass(
                _passwordController.text, _confirmPassController.text) ==
            true) {
      await _repo.r500UserProvider
          .p500User(501, param)
          .catchError((error, stackTrace) {
        SnackBar(content: Text("Error"));
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
      EasyLoading.showSuccess("Register Success");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(controller: _nameController, hintText: "Name"),
                InputField(controller: _phoneController, hintText: "Phone"),
                StreamBuilder(
                  stream: _registerBloc.emailStream,
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    return InputField(
                      controller: _emailController,
                      hintText: "Email",
                      errorText: snapshot.hasError ? "${snapshot.error}" : null,
                    );
                  },
                ),
                StreamBuilder(
                  stream: _registerBloc.passwordStream,
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    return PasswordField(
                      controller: _passwordController,
                      hintText: "Password",
                      errorText: snapshot.hasError ? "${snapshot.error}" : null,
                    );
                  },
                ),
                PasswordField(
                    controller: _confirmPassController,
                    hintText: "Confirm Password"),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  width: size.width * 0.9,
                  height: size.height * 0.07,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                      onPressed: () {
                        _signUp(context);
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
      ),
    );
  }
}
