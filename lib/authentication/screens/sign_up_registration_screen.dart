import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled8/authentication/controllers/sign_up_controller.dart';
import 'package:untitled8/core/widget/app_textfields.dart';

import '../../core/constants/colors.dart';
import '../../core/provider/global_loader.dart';
import '../../core/utils/images_res.dart';
import '../../core/widget/app_bar.dart';
import '../../core/widget/button_widgets.dart';
import '../../core/widget/text_widgets.dart';
import '../notifier/validation_notifier.dart';
import '../widgets/decorated_container.dart';

class SignUpRegistrationScreen extends ConsumerStatefulWidget {
  static const String routeName = "/SignUpRegistrationScreen";

  const SignUpRegistrationScreen({super.key});

  @override
  ConsumerState<SignUpRegistrationScreen> createState() =>
      _SignUpRegistrationScreenState();
}

class _SignUpRegistrationScreenState
    extends ConsumerState<SignUpRegistrationScreen> {
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
          Column(
            children: [
              customAppBar(
                context,
                "Sign Up",
                prefixedImage: true,
                postFixedImage: false,
                iconName: ImageRes.arrow,
              ),
              Expanded(
                child: SingleChildScrollView(
                  // Added SingleChildScrollView here
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            text25Heading(
                              text: "Please verify your details,",
                              color: AppColors.primarySecondaryElementText,
                            ),
                            const SizedBox(height: 10),
                            text12Normal(
                              color: AppColors.primarySecondaryElementText,
                              text:
                              "You can edit any detail that does not tally but this will require you to provide your NIN",
                            ),
                            const SizedBox(height: 10),
                            appTextField(
                              inputValidity: validationState.isPhoneNumberFieldValid,
                              controller: _signUpController.firstNameController,
                              isNumberKeyboard: true,
                              text: "First name",
                            ),
                            const SizedBox(height: 10),
                            appTextField(
                              inputValidity: validationState.isPhoneNumberFieldValid,
                              controller: _signUpController.lastNameController,
                              isNumberKeyboard: true,
                              text: "Last name",
                            ),
                            const SizedBox(height: 10),
                            appTextField(
                              inputValidity: validationState.isPhoneNumberFieldValid,
                              controller: _signUpController.phoneNumberController,
                              isNumberKeyboard: true,
                              text: "Phone number",
                            ),
                            const SizedBox(height: 10),
                            appTextField(
                              inputValidity: validationState.isPhoneNumberFieldValid,
                              controller: _signUpController.emailController,
                              isNumberKeyboard: true,
                              text: "Email address",
                            ),
                            const SizedBox(height: 10),
                            appTextField(
                              inputValidity: validationState.isPhoneNumberFieldValid,
                              controller: _signUpController.idTypeController,
                              isNumberKeyboard: true,
                              text: "ID Type",
                            ),
                            const SizedBox(height: 10),
                            appTextField(
                              inputValidity: validationState.isPhoneNumberFieldValid,
                              controller:
                              _signUpController.identificationNumberController,
                              isNumberKeyboard: true,
                              text: "Identification Number",
                            ),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text:
                                    'By creating an account you have agreed to our',
                                    style: const TextStyle(
                                      color: AppColors.primarySecondaryElementText,
                                      fontSize: 12,
                                      fontFamily: 'GothamMedium',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' Terms of Service',
                                        style: const TextStyle(
                                          color: AppColors.greenButton,
                                          fontSize: 14,
                                          fontFamily: 'GothamBold',
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: ' and',
                                        style: TextStyle(
                                          color: AppColors.primarySecondaryElementText,
                                          fontSize: 12,
                                          fontFamily: 'GothamBold',
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Privacy policy',
                                        style: const TextStyle(
                                          color: AppColors.greenButton,
                                          fontSize: 14,
                                          fontFamily: 'GothamBold',
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {},
                                      )
                                    ])),
                            const SizedBox(height: 40), // Add spacing if needed
                            appButton(
                                textColor: Colors.white,
                                buttonColor: AppColors.greenButton,
                                buttonName: "Done",
                                isLogin: false,
                                context: context,
                                func: () {
                                  _signUpController.validatePhoneNumberField();
                                  final isValidInput =
                                      ref.read(validationProvider).isValidInputs;
                                  if(isValidInput){
                                    _signUpController.navigateToOtpScreen(context);
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (loader) buildCustomCircularProgressIndicator(),
            ],
          )

        ],
      ),
    );
  }
}
