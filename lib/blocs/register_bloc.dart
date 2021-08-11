import 'dart:async';

import 'package:field_for_rent/method/validations.dart';
import 'package:rxdart/rxdart.dart';

final valid = Validations();

class RegisterBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();

  void setEmail(String value) => _email.sink.add(value);
  void setPass(String value) => _password.sink.add(value);
  void setConfirmPass(String value) => _confirmPassword.sink.add(value);

  Stream<String> get email => _email.stream.transform(emailValidate);
  Stream<String> get password => _password.stream.transform(passValidate);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(passValidate).doOnData((event) {
        if (0 != getPassTxt.compareTo(event)) {
          _confirmPassword.addError("The passwords do not match");
        }
      });

  String get getEmailTxt => _email.value;
  String get getPassTxt => _password.value;
  String get getConfirmPassTxt => _confirmPassword.value;

  var emailValidate =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    var isValid =
        RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]").hasMatch(email);
    if (email.isEmpty) {
      sink.addError('Enter the email');
    } else if (!isValid) {
      sink.addError('Email invalid');
    } else {
      sink.add(email);
    }
  });

  var passValidate =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.isEmpty) {
      sink.addError('Enter the password');
    } else if (pass.length < 6) {
      sink.addError("Email invalid. Please include an '@' in the email");
    } else {
      sink.add(pass);
    }
  });

  void dispose() {
    _email.close();
    _password.close();
    _confirmPassword.close();
  }
}
