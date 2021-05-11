import 'package:flutter/material.dart';
import 'package:stack_finance/metadata/meta_asset.dart';
import 'package:stack_finance/routes.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.onboarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            MetaAsset.loadingBg,
            height: _height,
            width: _width,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(),
              Image.asset(
                MetaAsset.logo,
                fit: BoxFit.fill,
                height: 125,
                width: 125,
              ),
              Text(
                "STACK",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom +
                      (_height * 0.05),
                ),
                child: CircularProgressIndicator(backgroundColor: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
