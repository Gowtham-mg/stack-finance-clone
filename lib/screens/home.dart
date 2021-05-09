import 'package:flutter/material.dart';
import 'package:stack_finance/widgets/login_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/home_bg.jpg",
            fit: BoxFit.fill,
            height: _height,
            width: _width,
          ),
          Positioned(
            top: _height * 0.45,
            left: _width * 0.05,
            width: _width * 0.9,
            height: _height * 0.55,
            child: Column(
              children: [
                Text(
                  "Get Your Money Right.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                LoginButton(
                  width: _width * 0.9,
                  text: "Create an Account",
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                    minWidth: _width * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    color: Colors.transparent,
                    onPressed: () {},
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
