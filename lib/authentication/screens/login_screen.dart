import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/authentication/screens/signup_screen.dart';
import '../../core/constants/colors.dart';
import '../../core/provider/global_loader.dart';
import '../../core/utils/images_res.dart';
import '../../core/widget/app_textfields.dart';
import '../../core/widget/button_widgets.dart';
import '../../core/widget/popup_messages.dart';
import '../../core/widget/text_widgets.dart';
import '../controllers/login_controller.dart';
import '../notifier/login_notifier.dart';
import '../notifier/validation_notifier.dart';
import '../notifier/visibility_notifier.dart';
import '../widgets/decorated_container.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/LoginScreen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    log("login screen called");
    _loginController = LoginController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final validationState = ref.watch(validationProvider);
    final passwordVisibility = ref.watch(visibilityNotifierProvider);
    final size = MediaQuery.of(context).size;
    final loader = ref.watch(appLoaderProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 54.0, bottom: 36.0, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    child: Column(
                      children: [
                        text25Heading(
                          text: "Welcome back",
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // buildCustomContainer(),
                        SizedBox(height: 20.h),
                        Center(child: Image.asset(ImageRes.user)),
                        SizedBox(height: 20.h),
                        appTextField(
                          inputValidity: validationState.isEmailFieldValid,
                          controller: _loginController.emailController,
                          text: "Email address",
                          obscureText: false,
                          func: (value) {
                            ref
                                .read(loginNotifierProvider.notifier)
                                .onUserEmailChange(value);
                            _loginController.validateEmailField();
                          },
                        ),
                        SizedBox(height: 20.h),
                        appTextField(
                          inputValidity: validationState.isPasswordFieldValid,
                          controller: _loginController.passwordController,
                          text: "Password",
                          obscureText: passwordVisibility,
                          func: (value) {
                            ref
                                .read(loginNotifierProvider.notifier)
                                .onUserPasswordChange(value);
                            _loginController.validatePasswordField();
                          },
                          suffixIcon: GestureDetector(
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: passwordVisibility
                                  ? AppColors.primarySecondaryElementText
                                  : AppColors
                                      .primarySecondaryElementText, // Example colors
                            ),
                            onTap: () {
                              ref
                                  .read(visibilityNotifierProvider.notifier)
                                  .togglePasswordVisibility();
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Forgot Password?',
                                  style: const TextStyle(
                                    color: AppColors.greyCard,
                                    fontSize: 14,
                                    fontFamily: 'GothamLight',
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context,
                                          '/ForgotCredentialsOptionsScreen');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 2.h),
                        Center(
                          child: appButton(
                            buttonName: "Login",
                            isLogin: true,
                            context: context,
                            func: () {
                              _loginController.validatePasswordField();
                              _loginController.validateEmailField();
                              final isValidInputs =
                                  ref.read(validationProvider).isValidInputs;
                              if (isValidInputs) {
                                _loginController.handleLogin(context);
                              } else {
                                toastInfo("Invalid inputs");
                              }
                            },
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'I dont have an account?',
                            style: const TextStyle(
                              color: AppColors.textColorLightPurple,
                              fontSize: 13,
                              fontFamily: 'GothamLight',
                            ),
                            children: [
                              TextSpan(
                                text: ' Create account',
                                style: const TextStyle(
                                  color: AppColors.unionColor,
                                  fontSize: 13,
                                  fontFamily: 'GothamLight',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            SignupScreen.routeName,
                                            (r) => false);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (loader) buildCustomCircularProgressIndicator(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }
}
