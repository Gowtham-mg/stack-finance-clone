import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Size size;
  final Function onPressed;
  final Widget child;
  final Color bgColor;
  final Color borderColor;

  const CustomOutlinedButton({
    Key key,
    @required this.size,
    @required this.onPressed,
    @required this.child,
    @required this.bgColor,
    @required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      child: child,
      height: size.height,
      minWidth: size.width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side:
            BorderSide(color: borderColor, width: 2, style: BorderStyle.solid),
      ),
      color: bgColor,
      padding: EdgeInsets.symmetric(vertical: 15),
      onPressed: onPressed,
    );
  }
}
