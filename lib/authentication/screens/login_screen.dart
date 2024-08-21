import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/provider/global_loader.dart';
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
    _loginController = LoginController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final validationState = ref.watch(validationProvider);
    final passwordVisibility = ref.watch(visibilityNotifierProvider);
    final size = MediaQuery.of(context).size;
    final loader = ref.watch(appLoaderProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 54.0, bottom: 36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    child: Column(
                      children: [
                        text25Heading(text: "Welcome back"),
                        text15Normal(
                            text: "Please provide your login credentials"),
                      ],
                    ),
                  ),
                  Align(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        appTextField(
                          inputValidity: validationState.isEmailFieldValid,
                          controller: _loginController.emailController,
                          text: "Email address",
                          iconName: "assets/icons/lock.png",
                          hintText: "Enter your Corporate ID",
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
                          iconName: "assets/icons/lock.png",
                          hintText: "Enter your password",
                          obscureText: passwordVisibility,
                          func: (value) {
                            ref
                                .read(loginNotifierProvider.notifier)
                                .onUserPasswordChange(value);
                            _loginController.validatePasswordField();
                          },
                          suffixIcon: GestureDetector(
                            child: Icon(passwordVisibility
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onTap: () {
                              ref
                                  .read(visibilityNotifierProvider.notifier)
                                  .togglePasswordVisibility();
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Forgot credentials?',
                              style: const TextStyle(
                                color: AppColors.textColorLightPurple,
                                fontSize: 17,
                                fontFamily: 'GothamLight',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Click here',
                                  style: const TextStyle(
                                    color: AppColors.unionColor,
                                    fontSize: 17,
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
                    height: size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Center(
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
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Dont have an account?',
                            style: const TextStyle(
                              color: AppColors.textColorLightPurple,
                              fontSize: 17,
                              fontFamily: 'GothamLight',
                            ),
                            children: [
                              TextSpan(
                                text: ' Sign Up',
                                style: const TextStyle(
                                  color: AppColors.unionColor,
                                  fontSize: 17,
                                  fontFamily: 'GothamLight',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
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
      bottomNavigationBar: Container(
        height: 50,
        color: AppColors.textColor800,
        child: const Image(
          image: AssetImage('assets/icons/union_logo_white.png'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }
}
