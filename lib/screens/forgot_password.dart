import 'package:flutter/material.dart';
import 'package:stack_finance/widgets/login_button.dart';

class ForgotPassword extends StatelessWidget {
  final InputBorder mobileNumberBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1.25,
    ),
  );

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/forgot_password_bg.jpg",
                height: _height * 0.45,
                width: _width,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: MediaQuery.of(context).viewPadding.top,
                left: _width * 0.05,
                child: BackButton(color: Colors.black),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: _width * 0.1,
              right: _width * 0.1,
              top: 20,
            ),
            child: Text(
              "Enter your registered mobile number",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 12, left: 10, right: 10),
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    "+91",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: mobileNumberBorder,
                        enabledBorder: mobileNumberBorder,
                        focusedBorder: mobileNumberBorder,
                        hintText: "Enter your mobile number",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: LoginButton(
              width: _width * 0.7,
              text: "Proceed",
              onPressed: () {},
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
