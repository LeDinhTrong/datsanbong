import 'package:field_for_rent/pages/components/bottom_navigation_bar.dart';
import 'package:field_for_rent/pages/views/account_page.dart';
import 'package:field_for_rent/pages/views/field_view.dart';
import 'package:field_for_rent/pages/views/history_view.dart';
import 'package:field_for_rent/pages/views/home_view.dart';
import 'package:field_for_rent/pages/views/signin_view.dart';
import 'package:field_for_rent/pages/views/signup_view.dart';
import 'package:flutter/material.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case navibarRoute:
        return MaterialPageRoute(builder: (_) => BottomNaviBar());
      case slpashRoute:
        return MaterialPageRoute(builder: (_) => BottomNaviBar());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case fieldRoute:
        return MaterialPageRoute(builder: (_) => FieldPage());
      case historyRoute:
        return MaterialPageRoute(builder: (_) => HistoryPage());
      case accountRoute:
        return MaterialPageRoute(builder: (_) => AccountPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text("No route defined for ${settings.name}"))));
    }
  }
}

const String loginRoute = '/login_page';
const String navibarRoute = '/navibar_page';
const String slpashRoute = '/splash_page';
const String signUpRoute = '/sign_up_page';
const String homeRoute = '/home_page';
const String fieldRoute = '/field_page';
const String historyRoute = '/history_page';
const String accountRoute = '/account_page';
