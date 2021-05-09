import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    @required this.width,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final double width;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      child: Text(text, style: TextStyle(color: Colors.white)),
      minWidth: width,
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      color: Color(0xFF2fc0ff),
      onPressed: onPressed,
    );
  }
}
