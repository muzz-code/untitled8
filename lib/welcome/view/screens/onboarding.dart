import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/core/constants/colors.dart';
import 'package:untitled8/core/utils/images_res.dart';
import 'package:untitled8/core/widget/image_widgets.dart';
import 'package:untitled8/welcome/view/widget/landing_page_util_widgets.dart';

import '../../../core/widget/button_widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/OnBoardingScreen';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController(initialPage: 0, viewportFraction: 1.0);
  final List<String> adTexts = [
    'Verify your Oxtra account using various list of identification type provided',
    'Set a pick up location/destination from a list of available routes going your way',
    'Make ride bookings, pay and remember to rate your driver!',
    'Share a new experience with verified riders and reduce cost of commuting',
    'Create a user profile/sign up with valid phone number in a proper number format'
  ];
  final List<String> adHeaderTexts = [
    'Verify your identity',
    'Select a route',
    'Book & Ride',
    'Carpooling? Why not?',
    'Sign Up & get started',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 250.h,
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: adTexts.length,
                      onPageChanged: (position) {
                        setState(() {
                          _currentPage = position;
                        });
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 200.w,
                              maxHeight: 200.h,
                            ),
                            child: Image.asset(
                              "assets/images/slide_show_item${index + 1}.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  buildLandingPageSliderHeaderText(adHeaderTexts[_currentPage]),
                  buildLandingPageSliderText(adTexts[_currentPage]),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          width: 60.0,
                          height: 60.0,
                        ),
                        CircularProgressIndicator(
                          value: (_currentPage + 1) / adTexts.length,
                          strokeWidth: 5.0,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.greenButton),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 20.0, top: 90),
              child: Column(
                children: [
                  appButton(
                      textColor: Colors.white,
                      buttonColor: AppColors.greenButton,
                      buttonName: "Create Account",
                      isLogin: false,
                      context: context,
                      func: () =>
                          Navigator.of(context).pushNamed('/SignupScreen' ?? "")),
                  const SizedBox(height: 16),
                  appButton(
                    buttonColor: AppColors.lightGreenBtn,
                    buttonName: "Login",
                    isLogin: false,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
