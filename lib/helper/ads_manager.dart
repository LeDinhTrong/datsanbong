import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9937229715986963~5614261551";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9937229715986963~8855518477";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9937229715986963/4950549599";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9937229715986963/9581921562";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9937229715986963/6362885376";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9937229715986963/3385368247";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9937229715986963/2294991318";
    } else if (Platform.isIOS) {
      return "ca-app-pub-9937229715986963/6531116774";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}