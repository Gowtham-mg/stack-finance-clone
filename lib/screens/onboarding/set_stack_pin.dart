import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_finance/metadata/meta_asset.dart';
import 'package:stack_finance/routes.dart';
import 'package:stack_finance/widgets/login_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetStackPin extends StatelessWidget {
  final TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            MetaAsset.stackPinBg,
            fit: BoxFit.fill,
            height: _height * 0.4,
            width: _width,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 2),
            child: Text(
              "Create New Stack PIN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            "emailaddress@gmail.com",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(flex: 1),
          SizedBox(
            height: 50,
            width: _width * 0.9,
            child: PinInputTextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _pinController,
              pinLength: 6,
              keyboardType: TextInputType.number,
              onChanged: (String val) async {
                String _otp = val.trim();
                if (_otp.length == 6 && _otp == '123456') {
                  Fluttertoast.showToast(
                    msg: "Stack pin has been set successfully",
                    toastLength: Toast.LENGTH_LONG,
                  );
                  Navigator.pushNamed(context, Routes.home);
                } else if (_otp.length == 6) {
                  // setState(() {
                  //   isOtpInvalid = true;
                  // });
                }
              },
              enabled: true,
              autoFocus: true,
              decoration: BoxLooseDecoration(
                gapSpace: 20,
                radius: Radius.circular(12),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                strokeColorBuilder: FixedColorBuilder(Colors.black54),
              ),
            ),
          ),
          Spacer(flex: 2),
          LoginButton(width: _width * 0.7, text: "Proceed", onPressed: () {}),
          Spacer(flex: 6),
        ],
      ),
    );
  }
}
