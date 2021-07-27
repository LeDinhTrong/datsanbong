class Validation {
  static String? validateEmail(String email) {
    if (email == null) {
      return "Email invalid";
    }
    var isValid =
        RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]").hasMatch(email);
    if (!isValid) {
      return "Email invalid";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password == null) {
      return "Password invalid";
    }
    if (password.length < 6) {
      return "Password require minimum 6 characters";
    }
    return null;
  }
}
