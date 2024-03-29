import 'package:flutter/material.dart';
import 'package:stack_finance/routes.dart';
import 'package:stack_finance/screens/onboarding/features_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.onboarding,
      home: FeaturesDialog(),
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
