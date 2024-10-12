import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled8/core/constants/colors.dart';
import 'package:untitled8/core/widget/app_bar.dart';
import 'package:untitled8/core/widget/image_widgets.dart';
import 'package:untitled8/core/widget/text_widgets.dart';

import '../../core/utils/images_res.dart';

class SignUpOtpScreen extends ConsumerStatefulWidget {
  static const String routeName = "/SignUpOtpScreen";

  const SignUpOtpScreen({super.key});

  @override
  ConsumerState<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends ConsumerState<SignUpOtpScreen> {
  List<String> currentPin = ["", "", "", "", "", ""];
  int pinIndex = 0;

  // Controllers and FocusNodes for each PIN field
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

  FocusNode pinOneFocus = FocusNode();
  FocusNode pinTwoFocus = FocusNode();
  FocusNode pinThreeFocus = FocusNode();
  FocusNode pinFourFocus = FocusNode();
  FocusNode pinFiveFocus = FocusNode();
  FocusNode pinSixFocus = FocusNode();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    pinOneController.dispose();
    pinTwoController.dispose();
    pinThreeController.dispose();
    pinFourController.dispose();
    pinFiveController.dispose();
    pinSixController.dispose();
    pinOneFocus.dispose();
    pinTwoFocus.dispose();
    pinThreeFocus.dispose();
    pinFourFocus.dispose();
    pinFiveFocus.dispose();
    pinSixFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            customAppBar(
              context,
              "",
              prefixedImage: true,
              postFixedImage: false,
              iconName: ImageRes.arrow,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  appImage(
                      imagePath: ImageRes.phoneIcon, height: 100, width: 100),
                  const SizedBox(
                    height: 20,
                  ),
                  text24Heading(
                      text: "OTP Verification", color: AppColors.greenButton),
                  RichText(
                      text: TextSpan(
                          text: 'Enter the OTP sent to',
                          style: const TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16,
                            fontFamily: 'GothamMedium',
                          ),
                          children: [
                        TextSpan(
                          text: ' 08126292235',
                          style: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 16,
                            fontFamily: 'GothamBold',
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        )
                      ])),
                  const SizedBox(height: 40.0),
                  buildPinRow(),
                  const SizedBox(height: 20.0),
                  RichText(
                      text: TextSpan(
                          text: 'Didnt receive the opt?',
                          style: const TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16,
                            fontFamily: 'GothamMedium',
                          ),
                          children: [
                            TextSpan(
                              text: ' Resend code',
                              style: const TextStyle(
                                color: AppColors.greenButton,
                                fontSize: 16,
                                fontFamily: 'GothamBold',
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            )
                          ])),
                  buildNumberPad(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildSecurityText() {
    return const Text(
      "OTP",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 21.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFiveController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinSixController,
        ),
      ],
    );
  }

  Widget buildNumberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    },
                  ),
                  KeyboardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    },
                  ),
                  KeyboardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    },
                  ),
                  KeyboardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    },
                  ),
                  KeyboardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    },
                  ),
                  KeyboardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    },
                  ),
                  KeyboardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    child: const MaterialButton(
                      onPressed: null,
                      child: SizedBox(),
                    ),
                  ),
                  KeyboardNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    },
                  ),
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      onPressed: clearPin, // Clears the pin when pressed
                      child: const Icon(Icons.backspace, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearPin() {
    if (pinIndex == 0) {
      return;
    } else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  void pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;

    if (pinIndex == 6) {
      String strPin = currentPin.join();
      log(strPin);
      Navigator.pushReplacementNamed(context, '/SignUpRegistrationScreen');
    }
  }

  void setPin(int index, String text) {
    switch (index) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  const PINNumber({
    super.key,
    required this.textEditingController,
    required this.outlineInputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Set the background color as needed
      child: SizedBox(
        width: 50.0,
        child: TextField(
          controller: textEditingController,
          enabled: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(6.0),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white30,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;

  const KeyboardNumber({super.key, required this.n, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24 * MediaQuery.of(context).textScaleFactor,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
