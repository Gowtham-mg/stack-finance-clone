import 'package:flutter/material.dart';
import 'package:stack_finance/routes.dart';
import 'package:stack_finance/screens/notifications.dart';
import 'package:stack_finance/screens/wealth.dart';

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
      // initialRoute: Routes.loading,
      home: Wealth(),
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
