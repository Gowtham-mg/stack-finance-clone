import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack_finance/widgets/login_button.dart';

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final InputBorder mobileNumberBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1.25,
    ),
  );

  bool connectThroughWhatsapp = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/forgot_password_bg.jpg",
              height: _height * 0.45,
              width: _width,
              fit: BoxFit.fill,
            ),
            Text(
              "What is your mobile number?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _width * 0.05,
                right: _width * 0.05,
                top: 40,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 1),
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
            Container(
              margin: EdgeInsets.only(
                top: 30.0,
                left: _width * 0.05,
                right: _width * 0.05,
                bottom: 35,
              ),
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
                right: _width * 0.05,
                left: _width * 0.04,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: connectThroughWhatsapp,
                    onChanged: (bool val) {
                      setState(() {
                        connectThroughWhatsapp = val;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15.0),
                    child: SvgPicture.asset(
                      "assets/icons/whatsapp.svg",
                      height: 15,
                      width: 15,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "We eould like to stay close! Enable WhatsApp notifications to receive updates about payments, budgeting, investment, rewards and more !",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            LoginButton(
              width: _width * 0.7,
              text: "Proceed",
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 65, bottom: 5),
              child: RichText(
                text: TextSpan(
                  text: "Stack Finance is ",
                  children: [
                    TextSpan(
                      text: "secure and private",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "assets/icons/onboarding_icon1.jpg",
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "ARN - 171554",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "assets/icons/onboarding_icon2.jpg",
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("BSE - 40535",
                          style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/icons/aws.png",
                  fit: BoxFit.fill,
                  height: 50,
                  width: 50,
                  color: Colors.grey.shade400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
