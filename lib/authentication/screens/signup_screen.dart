import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/authentication/controllers/login_controller.dart';
import 'package:untitled8/authentication/controllers/sign_up_controller.dart';
import 'package:untitled8/core/constants/colors.dart';
import 'package:untitled8/core/widget/app_textfields.dart';
import 'package:untitled8/core/widget/button_widgets.dart';
import 'package:untitled8/core/widget/image_widgets.dart';
import '../../core/provider/global_loader.dart';
import '../../core/utils/images_res.dart';
import '../../core/widget/text_widgets.dart';
import '../notifier/validation_notifier.dart';
import '../widgets/decorated_container.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  static const routeName = '/SignupScreen';

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  late SignUpController _signUpController;

  @override
  void initState() {
    super.initState();
    _signUpController = SignUpController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);
    final validationState = ref.watch(validationProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First container at the top
                Column(
                  children: [
                    appImage(
                        imagePath: ImageRes.oxtraLogoColored,
                        height: 120,
                        width: 120),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text25Heading(text: "Welcome,"),
                        const SizedBox(height: 15),
                        appTextField(
                          inputValidity: validationState.isPhoneNumberFieldValid,
                          controller: _signUpController.phoneNumberController,
                          isNumberKeyboard: true,
                          text: "Please enter your phone number",
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontFamily: 'GothamMedium',
                        ),
                        children: [
                          TextSpan(
                            text: ' Login',
                            style: const TextStyle(
                              color: AppColors.greenButton,
                              fontSize: 14,
                              fontFamily: 'GothamMedium',
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Add spacing if needed
                    appButton(
                        textColor: Colors.black,
                        buttonColor: AppColors.greenButton,
                        buttonName: "Continue",
                        isLogin: false,
                        context: context,
                        func: () {
                          _signUpController.validatePhoneNumberField();
                          final isValidInput =
                              ref.read(validationProvider).isValidInputs;
                          if(isValidInput){
                            _signUpController.handleSignUp();
                            _signUpController.navigateToOtpScreen(context);
                          }
                        }),
                  ],
                )
              ],
            ),
          ),
          if (loader) buildCustomCircularProgressIndicator(),
        ],
      ),
    );
  }
}
