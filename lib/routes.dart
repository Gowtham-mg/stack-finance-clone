import 'package:flutter/material.dart';
import 'package:stack_finance/screens/home.dart';
import 'package:stack_finance/screens/loading.dart';
import 'package:stack_finance/screens/login_screen.dart';
import 'package:stack_finance/screens/onboarding.dart';

class Routes {
  static const String auth = "/auth";
  static const String home = "/home";
  static const String onboarding = "/onboarding";
  static const String loading = "/loading";

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (BuildContext context) => Onboarding());
      case Routes.loading:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoadingScreen());

      case Routes.auth:
        bool isSignup = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (BuildContext context) => AuthScreen(isSignup: isSignup));
    }
  }
}
