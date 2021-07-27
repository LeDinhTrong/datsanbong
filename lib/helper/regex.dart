class CustomRegex {

  static final RegExp stringNormal =  RegExp(r'[!@#<>?"`~;[\]\\|\$=+)(*&^%]');

  static final RegExp stringSKU =  RegExp(r'^[a-zA-Z0-9]+$');

  static checkStringNormal(String s) {
    try {
      return stringNormal.hasMatch(s);
    } catch (e) {
      print(e);
      return false;
    }
  }

  static checkStringSKU(String s) {
    try {
      return !stringSKU.hasMatch(s);
    } catch (e) {
      print(e);
      return true;
    }
  }

}
