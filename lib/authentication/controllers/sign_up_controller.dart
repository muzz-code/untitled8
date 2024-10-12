import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/constants.dart';
import '../notifier/validation_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  TextEditingController phoneNumberController = TextEditingController();

  void validatePhoneNumberField() {
    final phoneNumber = phoneNumberController.text;
    ref
        .read(validationProvider.notifier)
        .validateField(value: phoneNumber, fieldType: AppConstants.PHONENUMBER);
  }

  void navigateToOtpScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/SignUpOtpScreen' ?? "");
  }
}
