import 'package:flutter/material.dart';

class HomeLinkAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text("Link accounts"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_width * 0.05),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.money)],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
