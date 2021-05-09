import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final TextStyle onboardingTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.w600,
);

final TextStyle onboardingDescriptionStyle =
    TextStyle(color: Colors.white, fontSize: 14);

class Onboarding extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.vertical;
    Widget pageIndicator = SmoothPageIndicator(
      count: 4,
      controller: controller,
      onDotClicked: (int index) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: Colors.lightBlueAccent,
        dotWidth: 6,
        dotHeight: 6,
        expansionFactor: 2,
        radius: 3,
        spacing: 10,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          children: [
            OnboardingItem(
              pageIndicator: pageIndicator,
              asset: "assets/images/onboarding4_bg.jpg",
              controller: controller,
              height: _height,
              width: _width,
              children: [
                Text(
                  "Your data is encrypted and SSL Secured",
                  style: onboardingTitleStyle,
                  textAlign: TextAlign.center,
                ),
                onboardingText(
                  _width,
                  "Stack is AMFI registered ARN holder: 171554",
                  "assets/icons/",
                ),
                onboardingText(
                  _width,
                  "Stack uses BSE mutual funds platform with member code: 40535",
                  "assets/icons/",
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _height * 0.025,
                    bottom: _height * 0.05,
                  ),
                  child: pageIndicator,
                ),
              ],
            ),
            OnboardingItem(
              pageIndicator: pageIndicator,
              asset: "assets/images/onboarding4_bg.jpg",
              width: _width,
              height: _height,
              controller: controller,
              children: [
                Text(
                  "Put savings on autopilot",
                  style: onboardingTitleStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Macbook? Bali trip with gang? Stack makes it all happen, We'll set your extra money aside automatically.",
                  style: onboardingDescriptionStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            OnboardingItem(
              pageIndicator: pageIndicator,
              asset: "assets/images/onboarding4_bg.jpg",
              width: _width,
              height: _height,
              controller: controller,
              children: [
                Text(
                  "Understand your money better",
                  style: onboardingTitleStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Because tracking isn't enough, Stack gives you helpful insights on how you can spend and save smarter.",
                  style: onboardingDescriptionStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            OnboardingItem(
              pageIndicator: pageIndicator,
              asset: "assets/images/onboarding4_bg.jpg",
              width: _width,
              height: _height,
              controller: controller,
              children: [
                Text(
                  "All accounts in one place",
                  style: onboardingTitleStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Get all your financial footprint under one app without hassle of juggling between different apps.",
                  style: onboardingDescriptionStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row onboardingText(double _width, String text, String asset) {
    return Row(
      children: [
        SvgPicture.asset(asset, height: 80, width: 60, fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.only(left: _width * 0.05),
          child: Text(
            text,
            style: onboardingDescriptionStyle,
          ),
        )
      ],
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final Widget pageIndicator;
  final String asset;
  final PageController controller;
  final List<Widget> children;
  final double width;
  final double height;

  const OnboardingItem({
    Key key,
    @required this.pageIndicator,
    @required this.asset,
    @required this.controller,
    @required this.children,
    @required this.width,
    @required this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              Text(
                controller.page.floor() == 4 ? "Skip" : "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
