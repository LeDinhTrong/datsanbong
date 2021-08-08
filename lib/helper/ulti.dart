import 'dart:io';
import 'dart:math';
import 'dart:ui';

class Ulti {
  // static const String BASE_URL_API = 'http://202.158.246.220:8080/api/';
  // static const String BASE_URL_API = 'http://192.168.1.11:4000/api/';
  // static const String BASE_URL_CDN = 'http://192.168.1.11:4000/';
  static const String BASE_URL_API =
      'http://10.0.2.2/field_for_rent/backend/P1Controller/C3Mobile/SelectAllByWhat.php';
  static const String BASE_URL_CDN = 'https://apibonds.crudcode.tk/';

  Ulti();

  static const colorBGPrimary = Color(0xFF2674E6);
  static const colorBGSecondary = Color(0xFFFFFFFF);
  static const colorBGDisable = Color(0xFFF1f1f1);
  static const colorTextDisable = Color(0xFFa3a3a3);
  static const colorBGInput = Color(0xFFF1f1f1);
  static const colorTextPrimary = Color(0xFF2674E6);
  static const colorNavPrimary = Color(0xFFFFFFFF);
  static const colorNavSecondary = Color(0xFF2674E6);
  static const colorNavUnselected = Color(0xFFa3a3a3);
  // static const colorTextPrimary = Color(0xFF2196F3);
  static const colorTextBlack = Color(0xFF464647);
  static const colorTextSecondary = Color(0xFF21A7F3);
  static const colorTextGrey = Color(0xFFa3a3a3);
  static const colorTextGreyLight = Color(0xFF21A7F3);
  static const colorTextLight = Color(0xFF00c9ff);

  static double getFontSize(double width, double height, double size) {
    final ratio = height / width;
    final delta = (ratio - 1.77777777778).abs();
    // print('delta ${delta}');
    // print('(width * 1.77777777778) / size ${(width * 1.77777777778) / size}');
    // print('(width * 1.33) / size ${(width * 1.33) / size}');
    // print('height / size ${height / size}');
    if (delta > 0.44) {
      print('man hinh ipad vao day');
      return (width) / size;
    } else if (delta > 0.1) {
      return (width * 1.77777777778) / size;
    } else {
      return height / size;
    }
  }

  static double getLabelPaddingSize(double width, double height) {
    const size = 100;
    final ratio = height / width;
    final delta = (ratio - 1.77777777778).abs();
    if (delta > 0.44) {
      // print('label padding ${(width) * 0.5 / size}');
      return (width) * 2.8 / size;
    } else if (delta > 0.1) {
      return (width * 1.77777777778) * 2.25 / size;
    } else {
      return height * 2.5 / size;
    }
  }

  static bool getScreenIs4_3(double width, double height) {
    final ratio = height / width;
    final delta = (ratio - 1.77777777778).abs();
    if (delta > 0.44) {
      return true;
    }
    return false;
  }

  static String? isPasswordValidText(String password) {
    if (password.length < 8) return 'Phải có tối thiểu 8 kí tự';
    if (!password.contains(RegExp(r"[a-z]")))
      return 'Phải có ít nhất 1 kí tự in thường';
    if (!password.contains(RegExp(r"[A-Z]")))
      return 'Phải có ít nhất 1 kí tự in hoa';
    if (!password.contains(RegExp(r"[0-9]"))) return 'Phải có ít nhất 1 số';
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
      return 'Phải có ít nhất 1 kí tự đặc biệt';
    return null;
  }

  static String getTrueFullURLImage(String url) {
    try {
      if (url.indexOf('http') == 0) return url;
      return BASE_URL_CDN + url;
    } on SocketException catch (_) {
      throw Exception("Not have internet");
    }
  }

  // static String getFullURLImagePostByNode(Post post) {
  //   try {
  //     print("loghere");
  //     print(post.node);
  //     print(post.image);
  //     return BASE_SCHEMA + post.node + BASE_DOMAIN + '/' + post.image;
  //   } on SocketException catch (_) {
  //     print(post);
  //     throw Exception("Not have internet");
  //   }
  // }
  //
  // static String getFullURLImageByNode(ImageResult imageResult) {
  //   try {
  //     return BASE_SCHEMA + imageResult.node + BASE_DOMAIN + '/' + imageResult.image;
  //   } on SocketException catch (_) {
  //     throw Exception("Not have internet");
  //   }
  // }

  static String getDaysCountDown(DateTime date) {
    final now = DateTime.now();
    final t1 = now.microsecondsSinceEpoch / 1000000;

    final t2 = date.microsecondsSinceEpoch / 1000000;

    return ((t2 - t1) ~/ 86400).toString();
  }

  static int getRandomInt(int min, int max) {
    Random random = new Random();
    return random.nextInt(max + 1) + min; // from 10 upto 99 included
  }

  // static String formatTextToast(String text) {
  //   return toBeginningOfSentenceCase(text);
  // }

  static String getImageBond(String code) {
    code = code.toLowerCase();
    final arrLogo = ['hpg', 'flc', 'vnm', 'vic'];
    // print('arrLogo ${arrLogo} ${arrLogo.length}');
    for (var i = 0; i < arrLogo.length; i++) {
      // print('code ${code} arrLogo[i] ${arrLogo[i]} indexOf ${code.indexOf(arrLogo[i])}');
      if (code.indexOf(arrLogo[i]) >= 0) {
        return 'assets/images/bonds/' + arrLogo[i] + '.png';
      }
    }
    return 'assets/images/bonds/no-image.png';
  }
}
