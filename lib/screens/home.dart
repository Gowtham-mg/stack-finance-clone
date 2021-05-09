import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack_finance/routes.dart';
import 'package:stack_finance/widgets/custom_outlined_button.dart';
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
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CreateAccountOptions(width: _width);
                      },
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  // ignore: deprecated_member_use
                  child: CustomOutlinedButton(
                    size: Size(_width * 0.9, 40),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.auth,
                        arguments: false,
                      );
                    },
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                    borderColor: Colors.white,
                    bgColor: Colors.transparent,
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

class CreateAccountOptions extends StatelessWidget {
  final double width;
  final TextStyle blueStyle =
      TextStyle(color: Colors.blue.shade300, fontSize: 14);

  CreateAccountOptions({Key key, @required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.only(
        top: 15,
        left: width * 0.05,
        right: width * 0.05,
        bottom: MediaQuery.of(context).viewPadding.bottom + 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 6),
              Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(flex: 4),
              IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          optionsButton(
            SvgPicture.asset(
              "assets/icons/google.svg",
              fit: BoxFit.fill,
              height: 22,
              width: 22,
            ),
            "Continue with Google",
            () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 25),
            child: optionsButton(
              Icon(Icons.email, color: Colors.grey, size: 22),
              "Continue with Email",
              () {
                Navigator.pushNamed(
                  context,
                  Routes.auth,
                  arguments: true,
                );
              },
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Privacy Policy",
                  style: blueStyle,
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "Terms and Conditions",
                  style: blueStyle,
                ),
              ],
              text:
                  "By continuing, you indicate you have read and agree to the ",
              style: TextStyle(color: Colors.grey),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  CustomOutlinedButton optionsButton(
    Widget icon,
    String text,
    Function onPressed,
  ) {
    return CustomOutlinedButton(
      size: Size(width * 0.9, 50),
      onPressed: onPressed,
      bgColor: Colors.white,
      borderColor: Colors.grey.shade300,
      child: Row(
        children: [
          Spacer(flex: 1),
          icon,
          Spacer(flex: 2),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
