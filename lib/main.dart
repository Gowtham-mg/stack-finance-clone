import 'package:flutter/material.dart';
import 'package:stack_finance/routes.dart';
import 'package:stack_finance/screens/forgot_password.dart';
import 'package:stack_finance/screens/home.dart';
import 'package:stack_finance/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
