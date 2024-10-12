import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/authentication/screens/sign_up_otp_screen.dart';
import 'package:untitled8/authentication/widgets/otp_screen.dart';
import 'package:untitled8/core/screens/dashboard.dart';
import 'package:untitled8/main.dart';
import 'package:untitled8/splash_screen.dart';
import 'package:untitled8/welcome/view/screens/onboarding.dart';

import '../../authentication/screens/homepage.dart';
import '../../authentication/screens/login_screen.dart';
import '../../authentication/screens/sign_up_registration_screen.dart';
import '../../authentication/screens/signup_screen.dart';
import '../../authentication/screens/verification.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomePageScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case VerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case Dashboard.routeName:
        return MaterialPageRoute(builder: (_) => const Dashboard());

      case OtpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      case OnBoardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case SignUpOtpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpOtpScreen());

      case SplashScreens.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreens());

      case SignUpRegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpRegistrationScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}