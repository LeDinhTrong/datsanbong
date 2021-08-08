class Validations {
  bool validEmail(String email) {
    if (email.isNotEmpty && email.length > 3 && email.contains('@')) {
      return true;
    } else {
      return false;
    }
  }

  bool validPass(String pass) {
    if (pass.isNotEmpty && pass.length > 5) {
      return true;
    } else {
      return false;
    }
  }

  bool validConfirmPass(String pass, String confirmPass) {
    if (pass.isNotEmpty && pass.length > 5 && pass == confirmPass) {
      return true;
    } else {
      return false;
    }
  }
}
