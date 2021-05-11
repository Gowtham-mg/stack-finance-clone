import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack_finance/metadata/meta_asset.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: Text("Notifications", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Container(
              child: Icon(
                Icons.close,
                color: Colors.grey,
                size: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(5),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SizedBox(
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: CircleAvatar(
                radius: _width * 0.2,
                backgroundColor: Colors.pink.shade100,
                child: SvgPicture.asset(
                  MetaAsset.notification,
                  height: _width * 0.4,
                  width: _width * 0.4,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              "You're all caught up!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
