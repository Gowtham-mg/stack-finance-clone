import 'package:flutter/material.dart';

class FeaturesDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF454061),
      body: Container(
        width: _width,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 10,
          right: _width * 0.05,
          bottom: MediaQuery.of(context).viewPadding.bottom + 20,
          left: _width * 0.05,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                "assets/images/features.jpg",
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Your security is our priority, all your data is super safe!",
                      style: TextStyle(
                        color: Colors.green.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(flex: 3),
                  featureItem(
                    "assets/icons/security_features/security.jpg",
                    "Your data is protected through bank grade security",
                    _width * 0.05,
                  ),
                  Spacer(flex: 2),
                  featureItem(
                    "assets/icons/security_features/encrypted.jpg",
                    "Your credentials and financial data is not visible to anyone, not even to us",
                    _width * 0.05,
                  ),
                  Spacer(flex: 2),
                  featureItem(
                    "assets/icons/security_features/cloudlock.jpg",
                    "We never perform any banking operations on your behalf",
                    _width * 0.05,
                  ),
                  Spacer(flex: 2),
                  featureItem(
                    "assets/icons/security_features/fingerprint.jpg",
                    "Do not share Stack Finance password/PIN with anyone",
                    _width * 0.05,
                  ),
                  Spacer(flex: 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row featureItem(String asset, String text, double padding) {
    return Row(
      children: [
        Image.asset(asset, fit: BoxFit.fill, height: 50, width: 50),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: padding),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
