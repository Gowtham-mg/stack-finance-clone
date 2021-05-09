import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stack_finance/widgets/login_button.dart';

enum LoginMode { Mobile, Email, Google }

extension on LoginMode {
  // String get name {
  //   if (this == LoginMode.Email) {
  //     return "Email";
  //   } else if (this == LoginMode.Mobile) {
  //     return "Mobile";
  //   } else {
  //     return "Google";
  //   }
  // }

  Widget get icon {
    if (this == LoginMode.Email) {
      return Icon(Icons.email, color: Colors.grey.shade700);
    } else if (this == LoginMode.Mobile) {
      return Icon(Icons.phone_iphone_rounded, color: Colors.grey.shade700);
    } else {
      return SvgPicture.asset("assets/icons/google.svg", height: 22, width: 22);
    }
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final InputBorder emailBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Colors.grey.shade100, width: 3),
  );

  LoginMode loginMode = LoginMode.Email;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Color(0xFF23204b)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Icon(
            Icons.account_circle,
            color: Color(0xFF1c1831),
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Login",
              style: TextStyle(
                color: Color(0xFF2a2446),
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: _width * 0.05,
              right: _width * 0.05,
              bottom: 20,
              top: 30,
            ),
            child: Row(
              children: [
                ...LoginMode.values
                    .map((e) => Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _width * 0.025),
                            child: LoginModeButton(
                                loginMode: e,
                                currentLoginMode: loginMode,
                                onPressed: (LoginMode _loginMode) {
                                  setState(() {
                                    loginMode = _loginMode;
                                  });
                                }),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFfcfdff),
                filled: true,
                hintText: "Enter mobile number",
                hintStyle: TextStyle(
                  color: Color(0xFFafafbb),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: emailBorder,
                enabledBorder: emailBorder,
                focusedBorder: emailBorder,
                contentPadding: EdgeInsets.only(
                  left: _width * 0.1,
                  top: 20,
                  bottom: 20,
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
          LoginButton(width: _width, text: "Proceed", onPressed: () {}),
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New user? ",
                style: TextStyle(
                  color: Color(0xFF8c8c8c),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                child: Text(
                  "Create a Account",
                  style: TextStyle(
                    color: Colors.teal.shade300,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
          Spacer(flex: 9),
        ],
      ),
    );
  }
}

class LoginModeButton extends StatelessWidget {
  const LoginModeButton({
    Key key,
    @required this.loginMode,
    @required this.onPressed,
    @required this.currentLoginMode,
  }) : super(key: key);
  final LoginMode loginMode;
  final LoginMode currentLoginMode;
  final ValueChanged<LoginMode> onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        side: BorderSide(
          color: loginMode == currentLoginMode
              ? Color(0xFFf5fafe)
              : Colors.grey.shade200,
          width: 2.5,
        ),
      ),
      color: loginMode == currentLoginMode ? Color(0xFFf5fafe) : Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: loginMode.icon,
      onPressed: () {
        onPressed(loginMode);
      },
    );
  }
}
