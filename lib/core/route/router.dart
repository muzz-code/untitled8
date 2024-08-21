import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/main.dart';

import '../../authentication/screens/homepage.dart';
import '../../authentication/screens/login_screen.dart';
import '../../authentication/screens/sign_up.dart';
import '../../authentication/screens/verification.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomePageScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case VerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}