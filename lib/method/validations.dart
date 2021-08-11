class Validations {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Enter the email";
    }
    var isValid =
        RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]").hasMatch(email);
    if (!isValid) {
      return "Email invalid";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Enter the password";
    }
    if (password.length < 6) {
      return "The password must be at least 6 characters";
    }
    return null;
  }

  bool validEmail(String email) {
    if (email.isNotEmpty && email.contains('@')) {
      return true;
    } else {
      return false;
    }
  }

  bool validPass(String pass) {
    if (pass.isNotEmpty && pass.length > 0) {
      return true;
    } else {
      return false;
    }
  }
}
