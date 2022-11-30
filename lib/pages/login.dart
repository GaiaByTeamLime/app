import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bluetooth.dart';
import '../components/page.dart';
// ignore: library_prefixes
import '../components/typography.dart' as Typography;
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum LoginPageStage {
  inputPhoneNumber,
  inputVerificationCode,
  phoneNumberVerified,
  inputName,
  accountIsReady,
}

class _LoginPageState extends State<LoginPage> {
  var stage = LoginPageStage.inputPhoneNumber;
  var phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: _getPage(),
    );
  }

  Widget _getPage() {
    switch (stage) {

// Navigator.popUntil(context, ModalRoute.withName('/'));
      case LoginPageStage.inputPhoneNumber:
        // TODO: Handle this case.
        return InputPhoneNumberLoginPage((String number) {
          phoneNumber = number;
          stage = LoginPageStage.inputVerificationCode;
        });
      case LoginPageStage.inputVerificationCode:
        return InputVerificationCodeLoginPage(phoneNumber, () {});
      case LoginPageStage.phoneNumberVerified:
        // TODO: Handle this case.
        break;
      case LoginPageStage.inputName:
        // TODO: Handle this case.
        break;
      case LoginPageStage.accountIsReady:
        // TODO: Handle this case.
        break;
    }
    return Text('hoi');
  }
}

class InputPhoneNumberLoginPage extends StatefulWidget {
  final void Function(String phoneNumber) nextStage;
  const InputPhoneNumberLoginPage(this.nextStage, {super.key});

  @override
  State<InputPhoneNumberLoginPage> createState() =>
      _InputPhoneNumberLoginPageState();
}

class _InputPhoneNumberLoginPageState extends State<InputPhoneNumberLoginPage> {
  var phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return EmptyPage(children: [
      const SizedBox(
        width: 300,
        child: Text(
          'What is your telephone number?',
          style: TextStyle(
              color: Color(0xFF0A5251),
              fontSize: 24,
              height: 1.5,
              fontFamily: 'Roboto'),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 40),
      InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          phoneNumber = number.phoneNumber ?? "";
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: PhoneNumber(isoCode: 'NL'),
        formatInput: false,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputBorder: const OutlineInputBorder(),
      ),
      const SizedBox(height: 40),
      Center(
          child: ElevatedButton(
              onPressed: () {
                widget.nextStage(phoneNumber);
              },
              child: const Text('Submit'))),
    ]);
  }
}

class InputVerificationCodeLoginPage extends StatefulWidget {
  final void Function() nextStage;
  final String phoneNumber;
  const InputVerificationCodeLoginPage(this.phoneNumber, this.nextStage,
      {super.key});

  @override
  State<InputVerificationCodeLoginPage> createState() =>
      _InputVerificationCodeLoginPageState();
}

class _InputVerificationCodeLoginPageState
    extends State<InputVerificationCodeLoginPage> {
  Future<bool> startVerify() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: ((context, snapshot) {}));
    EmptyPage(children: [
      Text('phoneNumber: ${widget.phoneNumber}'),
    ]);
  }
}
