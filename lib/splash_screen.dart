import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled8/core/utils/images_res.dart';
import 'package:untitled8/welcome/view/screens/onboarding.dart';

class SplashScreens extends StatefulWidget {
  static const routeName = '/SplashScreens';

  const SplashScreens({super.key});

  @override
  _SplashScreenStates createState() => _SplashScreenStates();
}

class _SplashScreenStates extends State<SplashScreens> {
  @override
  void initState() {
    //
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(OnBoardingScreen.routeName, (r) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Image.asset(
                          ImageRes.oxtraLogoColored,
                          fit: BoxFit.fitWidth,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
