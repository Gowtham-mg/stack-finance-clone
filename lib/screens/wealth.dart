import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stack_finance/metadata/meta_asset.dart';

class Wealth extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.vertical;
    final Widget pageIndicator = RotatedBox(
      quarterTurns: 1,
      child: SmoothPageIndicator(
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
          activeDotColor: Colors.black,
          dotWidth: 16,
          dotHeight: 8,
          expansionFactor: 4,
          radius: 8,
          spacing: 10,
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.vertical,
              controller: controller,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return WealthItem(height: _height, width: _width, page: index);
              },
            ),
            Positioned(
              top: 20,
              right: _width * 0.05,
              child: pageIndicator,
            ),
          ],
        ),
      ),
    );
  }
}

class WealthItem extends StatelessWidget {
  const WealthItem({
    Key key,
    @required this.height,
    @required this.width,
    @required this.page,
  }) : super(key: key);

  final double height;
  final double width;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${MetaAsset.wealthImage}$page.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.025),
            child: page == 3
                ? Text(
                    "Close",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                : Column(
                    children: [
                      RotatedBox(
                        child: Icon(
                          Icons.double_arrow,
                          color: Colors.grey,
                        ),
                        quarterTurns: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Swipe up",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
