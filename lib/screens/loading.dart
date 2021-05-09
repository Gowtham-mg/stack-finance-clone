import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text(
            "STACK",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: _width * 0.05,
              right: _width * 0.05,
            ),
            child: Text(
              "Say hello to financial freedom and goodbye to financial regrets",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          CircularProgressIndicator(backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
