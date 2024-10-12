import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/core/constants/colors.dart';

buildLandingPageSliderHeaderText(String text) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.greenButton,
          fontFamily: 'GothamMedium',
          fontSize: 27,
        ),
        softWrap: true,
      ),
    ),
  );
}

buildLandingPageSliderText(String text) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.greyLetters,
          fontFamily: 'GothamMedium',
          fontSize: 15,
        ),
        softWrap: true,
      ),
    ),
  );
}