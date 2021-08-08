import 'dart:async';

import 'package:field_for_rent/method/validations.dart';

final valid = Validations();

class RegisterBloc {
  StreamController _emailController = StreamController();
  StreamController _passwordController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidEmail(String email) {
    if (valid.validEmail(email) == false) {
      _emailController.sink.addError(
          "Email invalid. Email must have '@', longer than 3 characters and\n is not emty");
      return false;
    } else {
      _emailController.sink.add("Success");
      return true;
    }
  }

  bool isValidConfirmPass(String pass, String confirmPass) {
    if (valid.validConfirmPass(pass, confirmPass) == false) {
      _passwordController.sink.addError(
          "Password invalid. Password must longer than 6 characters, is not\n emty, password = confirm password");
      return false;
    } else {
      _passwordController.sink.add("Success");
      return true;
    }
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
