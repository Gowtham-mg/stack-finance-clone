import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stack_finance/routes.dart';

final TextStyle onboardingTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 27,
  fontWeight: FontWeight.w600,
);

final TextStyle onboardingDescriptionStyle =
    TextStyle(color: Colors.white, fontSize: 16, height: 1.5);

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller;
  Widget pageIndicator;

  int page = 0;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    pageIndicator = SmoothPageIndicator(
      count: 4,
      controller: controller,
      onDotClicked: (int index) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
        setState(() {
          page = index;
        });
      },
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: Colors.lightBlueAccent,
        dotWidth: 8,
        dotHeight: 8,
        expansionFactor: 7,
        radius: 4,
        spacing: 10,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.vertical;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  page = index;
                });
              },
              children: [
                OnboardingItem(
                  asset: "assets/images/onboarding1_bg.jpg",
                  width: _width,
                  height: _height,
                  page: page,
                  children: [
                    Text(
                      "All accounts in one place",
                      style: onboardingTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 0.025),
                      child: Text(
                        "Get all your financial footprint under one app without hassle of juggling between different apps.",
                        style: onboardingDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                OnboardingItem(
                  asset: "assets/images/onboarding2_bg.jpg",
                  width: _width,
                  height: _height,
                  page: page,
                  children: [
                    Text(
                      "Understand your money better",
                      style: onboardingTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 0.025),
                      child: Text(
                        "Because tracking isn't enough, Stack gives you helpful insights on how you can spend and save smarter.",
                        style: onboardingDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                OnboardingItem(
                  asset: "assets/images/onboarding3_bg.jpg",
                  width: _width,
                  height: _height,
                  page: page,
                  children: [
                    Text(
                      "Put savings on autopilot",
                      style: onboardingTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 0.025),
                      child: Text(
                        "Macbook? Bali trip with gang? Stack makes it all happen, We'll set your extra money aside automatically.",
                        style: onboardingDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                OnboardingItem(
                  asset: "assets/images/onboarding4_bg.jpg",
                  page: page,
                  height: _height,
                  width: _width,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        "Your data is encrypted and SSL Secured",
                        style: onboardingTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onboardingText(
                      _width,
                      "Stack is AMFI registered ARN holder: 171554",
                      "assets/icons/onboarding_icon1.jpg",
                    ),
                    onboardingText(
                      _width,
                      "Stack uses BSE mutual funds platform with member code: 40535",
                      "assets/icons/onboarding_icon2.jpg",
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: _width * 0.05,
              bottom: _height * 0.03,
              width: _width * 0.9,
              child: Center(child: pageIndicator),
            )
          ],
        ),
      ),
    );
  }

  Row onboardingText(double _width, String text, String asset) {
    return Row(
      children: [
        Image.asset(asset, height: 60, width: 60, fit: BoxFit.fill),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: _width * 0.05),
            child: Text(
              text,
              style: onboardingDescriptionStyle,
              maxLines: null,
            ),
          ),
        )
      ],
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String asset;
  final int page;
  final List<Widget> children;
  final double width;
  final double height;

  const OnboardingItem({
    Key key,
    @required this.asset,
    @required this.page,
    @required this.children,
    @required this.width,
    @required this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.fill,
        ),
      ),
      height: height,
      width: width,
      padding: EdgeInsets.only(
        top: 10,
        right: width * 0.05,
        left: width * 0.05,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
              child: Text(
                page == 3 ? "Continue" : "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Spacer(),
          ...children,
          SizedBox(height: (height * 0.065) + 16)
        ],
      ),
    );
  }
}
