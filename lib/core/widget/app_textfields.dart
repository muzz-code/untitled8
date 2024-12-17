import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/core/widget/text_widgets.dart';

import '../../core/constants/colors.dart';
import 'app_shadow.dart';

Widget appTextField({
  String text = "",
  String iconName = "",
  bool obscureText = false,
  void Function(String value)? func,
  TextEditingController? controller,
  GestureDetector? suffixIcon,
  bool? inputValidity,
  double? paddingLeft,
  double? paddingRight,
  Widget? textWidget,
  double? borderRadius,
  double? textFieldHeight,
  double? textFieldWidth,
  bool? isNumberKeyboard,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget ??
          text12Normal(
              text: text, color: AppColors.primarySecondaryElementText),
      SizedBox(
        height: 5.h,
      ),
      Container(
        decoration: appBoxDecorationTextField(
            inputValidity: inputValidity,
            radius: borderRadius ?? 10.0,
            color: AppColors.lightGreenBackgroundColor),
        child: Row(
          children: [
            SizedBox(
              width: textFieldWidth ?? 280.w,
              height: textFieldHeight ?? 50.h,
              child: TextField(
                controller: controller,
                style: const TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontFamily: 'GothamLight'),
                onChanged: (value) => func ?? (value),
                keyboardType: isNumberKeyboard == true
                    ? TextInputType.number // Set number keyboard if true
                    : TextInputType.text,
                // Default keyboard type
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontFamily: 'GothamLight',
                    fontSize: 15,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                maxLines: 1,
                autocorrect: false,
                obscureText: obscureText,
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 280,
  double height = 50,
  void Function(String value)? func,
  bool obscureText = false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //default border without any input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //focused border is with input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),

      maxLines: 1,
      autocorrect: false,
      //by defualt it's false
      obscureText: obscureText,
    ),
  );
}
