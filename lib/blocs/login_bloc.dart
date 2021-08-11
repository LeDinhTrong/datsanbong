import 'dart:async';

class LoginBloc {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  void setEmail(String value) => _email.sink.add(value);
  void setPass(String value) => _password.sink.add(value);

  Stream<String> get email => _email.stream.transform(emailValidate);
  Stream<String> get password => _password.stream.transform(passValidate);

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
  }
}
