import 'package:flutter/material.dart';
import 'package:stack_finance/screens/home.dart';
import 'package:stack_finance/screens/login_screen.dart';

class Routes {
  static const String auth = "/auth";
  static const String home = "/home";

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case Routes.auth:
        bool isSignup = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (BuildContext context) => AuthScreen(isSignup: isSignup));
    }
  }
}
