import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  final bool showChild;
  final Widget child;

  const NavigationWidget(
      {Key key, @required this.showChild, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TickerMode(
      enabled: !showChild,
      child: Offstage(offstage: showChild, child: child),
    );
  }
}
