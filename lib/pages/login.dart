import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../components/page.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum LoginPageStage {
  inputPhoneNumber,
  inputVerificationCode,
  phoneNumberVerified
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
      case LoginPageStage.inputPhoneNumber:
        return InputPhoneNumberLoginPage((String number) {
          setState(() {
            phoneNumber = number;
            stage = LoginPageStage.inputVerificationCode;
          });
        });
      case LoginPageStage.inputVerificationCode:
        return InputVerificationCodeLoginPage(phoneNumber, () {
          setState(() {
            stage = LoginPageStage.phoneNumberVerified;
          });
        });
      case LoginPageStage.phoneNumberVerified:
        return PhoneNumberVerified(() {
          Navigator.pushNamed(context, '/');
        });
    }
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

class AuthResponse {
  const AuthResponse();
}

class VerificationDoneAuthResponse extends AuthResponse {
  final PhoneAuthCredential credential;
  const VerificationDoneAuthResponse(this.credential);
}

class VerificationErrorAuthResponse extends AuthResponse {
  final FirebaseAuthException error;
  const VerificationErrorAuthResponse(this.error);
}

class VerificationCodeNeededAuthResponse extends AuthResponse {
  final String verificationId;
  VerificationCodeNeededAuthResponse(this.verificationId);
}

class AuthThingy {
  final Completer<AuthResponse> _completer = Completer();

  Future<AuthResponse> doOperation(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
    return _completer.future;
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    _completer.complete(VerificationCodeNeededAuthResponse(verificationId));
  }

  void _codeSent(String verificationId, int? resendToken) {
    // Instantly time out the verification since this will not be
    // done on iOS devices (you can't auto read sms messages).
    _codeAutoRetrievalTimeout(verificationId);
  }

  // Something calls this when the value is ready.
  Future<void> _verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);

    _completer.complete(VerificationDoneAuthResponse(credential));
  }

  // If something goes wrong, call this.
  void _verificationFailed(FirebaseAuthException e) {
    _completer.completeError(VerificationErrorAuthResponse(e));
  }
}

class SecondAuthThingy {}

class _InputVerificationCodeLoginPageState
    extends State<InputVerificationCodeLoginPage> {
  final TextEditingController _controller = TextEditingController();

  Future<AuthResponse> startVerify() async {
    AuthThingy phoneAuth = AuthThingy();
    return phoneAuth.doOperation(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: startVerify(),
      builder: ((BuildContext context, AsyncSnapshot<AuthResponse> snapshot) {
        if (snapshot.hasError) {
          return EmptyPage(children: [
            Center(
              child: Text(
                '${(snapshot.error as VerificationErrorAuthResponse).error} occurred',
                style: const TextStyle(fontSize: 18),
              ),
            )
          ]);
        } else if (snapshot.hasData) {
          if (snapshot.data is VerificationCodeNeededAuthResponse) {
            return EmptyPage(children: [
              const SizedBox(
                width: 300,
                child: Text(
                  'Input verification code',
                  style: TextStyle(
                      color: Color(0xFF0A5251),
                      fontSize: 24,
                      height: 1.5,
                      fontFamily: 'Roboto'),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Code",
                  hintText: "000000",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                controller: _controller,
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: (snapshot.data
                                    as VerificationCodeNeededAuthResponse)
                                .verificationId,
                            smsCode: _controller.text);

                    // Sign the user in (or link) with the credential
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);

                    widget.nextStage();
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]);
          } else if (snapshot.data is VerificationErrorAuthResponse) {
            return EmptyPage(children: [
              Center(
                child: Text(
                  '${(snapshot.data as VerificationErrorAuthResponse).error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ]);
          } else if (snapshot.data is VerificationDoneAuthResponse) {}
        }
        return EmptyPage(
          children: [
            const Center(child: CircularProgressIndicator()),
            Platform.isIOS
                ? const Text('')
                : const Text('Waiting for text message...'),
          ],
        );
      }),
    );
  }
}

class PhoneNumberVerified extends StatefulWidget {
  final void Function() nextStage;
  const PhoneNumberVerified(this.nextStage, {super.key});

  @override
  State<PhoneNumberVerified> createState() => _PhoneNumberVerifiedState();
}

class _PhoneNumberVerifiedState extends State<PhoneNumberVerified> {
  Timer? timer;

  void startTimer() {
    if (timer != null) return;

    timer = Timer(const Duration(seconds: 3), widget.nextStage);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();

    return EmptyPage(children: [
      const SizedBox(
        width: 300,
        child: Text(
          'Phone number verified',
          style: TextStyle(
              color: Color(0xFF0A5251),
              fontSize: 24,
              height: 1.5,
              fontFamily: 'Roboto'),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 40),
      Image.asset('assets/images/check.png'),
    ]);
  }
}
