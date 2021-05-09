import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stack_finance/widgets/login_button.dart';
import 'package:stack_finance/widgets/navigation_widget.dart';

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
  final bool isSignup;

  const LoginScreen({Key key, @required this.isSignup}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignup;

  @override
  void initState() {
    isSignup = widget.isSignup;
    super.initState();
  }

  Null onAuthModeChanged() {
    setState(() {
      isSignup = !isSignup;
    });
  }

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
      body: Stack(
        children: [
          NavigationWidget(
            showChild: isSignup,
            child: Signup(onAuthModeChanged: onAuthModeChanged, width: _width),
          ),
          NavigationWidget(
            showChild: !isSignup,
            child: Login(onAuthModeChanged: onAuthModeChanged, width: _width),
          )
        ],
      ),
    );
  }
}

class Signup extends StatefulWidget {
  final double width;
  final Function onAuthModeChanged;

  const Signup(
      {Key key, @required this.width, @required this.onAuthModeChanged})
      : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  LoginMode loginMode = LoginMode.Email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
      child: Column(
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
                                horizontal: widget.width * 0.025),
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
          if (loginMode == LoginMode.Mobile)
            AuthInputField(
              width: widget.width * 0.1,
              hintText: "Enter mobile number",
            )
          else
            Column(
              children: [
                AuthInputField(
                  width: widget.width * 0.1,
                  hintText: "Email Address",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: AuthInputField(
                    width: widget.width * 0.1,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                ),
              ],
            ),
          Spacer(flex: loginMode == LoginMode.Mobile ? 1 : 3),
          LoginButton(width: widget.width, text: "Proceed", onPressed: () {}),
          Spacer(flex: 1),
          AuthTextNButton(
            onAuthModeChanged: widget.onAuthModeChanged,
            text: "New user? ",
            subText: "Create a Account",
          ),
          Spacer(flex: loginMode == LoginMode.Mobile ? 9 : 6),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  final Function onAuthModeChanged;
  final double width;

  const Login({Key key, @required this.onAuthModeChanged, @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          Icon(
            Icons.account_circle,
            color: Color(0xFF1c1831),
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 30),
            child: Text(
              "Sign up",
              style: TextStyle(
                color: Color(0xFF2a2446),
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AuthInputField(
            width: 15,
            hintText: "First Name",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AuthInputField(
              width: 15,
              hintText: "Last Name",
            ),
          ),
          AuthInputField(
            width: 15,
            hintText: "Email Address",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AuthInputField(
              width: 15,
              hintText: "Password",
              isPasswordField: true,
            ),
          ),
          AuthInputField(
            width: 15,
            hintText: "Confirm Password",
            isPasswordField: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 30),
            child: LoginButton(
              width: width * 0.7,
              text: "Proceed",
              onPressed: () {},
            ),
          ),
          AuthTextNButton(
            onAuthModeChanged: onAuthModeChanged,
            text: "Already have an account? ",
            subText: "Login",
          ),
        ],
      ),
    );
  }
}

final InputBorder emailBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: Colors.grey.shade100, width: 3),
);

class AuthInputField extends StatefulWidget {
  const AuthInputField({
    Key key,
    @required this.width,
    @required this.hintText,
    this.isPasswordField = false,
  }) : super(key: key);

  final double width;
  final String hintText;
  final bool isPasswordField;

  @override
  _AuthInputFieldState createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Color(0xFFfcfdff),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xFFafafbb),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: emailBorder,
        enabledBorder: emailBorder,
        focusedBorder: emailBorder,
        contentPadding:
            EdgeInsets.only(left: widget.width, top: 20, bottom: 20),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: isPasswordVisible
                    ? Icon(Icons.remove_red_eye)
                    : SvgPicture.asset(
                        "assets/icons/invisible.svg",
                        height: 22,
                        width: 22,
                        fit: BoxFit.fill,
                      ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
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

class AuthTextNButton extends StatelessWidget {
  const AuthTextNButton({
    Key key,
    @required this.onAuthModeChanged,
    @required this.text,
    @required this.subText,
  }) : super(key: key);

  final Function onAuthModeChanged;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF8c8c8c),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          child: Text(
            subText,
            style: TextStyle(
              color: Colors.teal.shade300,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onAuthModeChanged,
        )
      ],
    );
  }
}
