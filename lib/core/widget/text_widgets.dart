import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';
import 'image_widgets.dart';

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    String? fontFamily = 'GothamLight'}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily),
  );
}

Widget text15Bold(
    {String text = "",
    Color color = AppColors.textColorLightPurple,
    TextOverflow overflow = TextOverflow.clip}) {
  return Text(
    text,
    overflow: overflow,
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: Colors.black,
        fontFamily: 'GothamLight',
        fontSize: 15,
        fontWeight: FontWeight.w900),
  );
}

Widget text15Normal(
    {String text = "",
    Color color = AppColors.textColorLightPurple,
    TextOverflow overflow = TextOverflow.clip}) {
  return Text(
    text,
    overflow: overflow,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontFamily: 'GothamLight',
      fontSize: 15,
    ),
  );
}

Widget text16Bold(
    {String text = "",
    Color color = AppColors.primarySecondaryElementText,
    String? fontFamily = 'GothamLight'}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily),
  );
}

Widget text16Normal(
    {String text = "",
    Color color = AppColors.primarySecondaryElementText,
    String? fontFamily = 'GothamLight'}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily),
  );
}

Widget text12Normal(
    {String text = "",
    Color color = AppColors.primarySecondaryElementText,
    String? fontFamily = 'GothamLight'}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color,
        fontSize: 12.sp,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily),
  );
}

Widget text14Bold(
    {String text = "",
    Color color = AppColors.textColorLightPurple,
    String? fontFamily = 'GothamMedium'}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily),
  );
}

Widget text14Medium(
    {String text = "",
    Color color = AppColors.textColorLightPurple,
    String? fontFamily = 'GothamMedium'}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily),
  );
}

Widget text14Normal(
    {String text = "",
    Color color = AppColors.textColorLightPurple,
    String? fontFamily = 'GothamLight'}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily),
  );
}

Widget text10Normal(
    {String text = "",
    Color color = AppColors.textColorLightPurple,
    String? fontFamily = 'GothamLight',
    String iconName = "",
    double width = 16,
    double height = 16}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily),
  );
}

Widget text25Heading({String text = "", Color color = AppColors.black}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontFamily: 'GothamMedium',
      fontSize: 25,
    ),
  );
}

Widget text18Heading(
    {String text = "",
    Color color = AppColors.primaryText,
    String iconName = "",
    double width = 16,
    double height = 16}) {
  return Row(
    children: [
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontFamily: 'GothamMedium',
          fontSize: 18,
        ),
      ),
      Container(
        // width: 24,
        margin: EdgeInsets.only(left: 8.w),
        child: appImage(
          imagePath: iconName,
          width: width,
          height: height,
        ),
      ),
    ],
  );
}

Widget text20Heading(
    {String text = "",
    Color color = AppColors.primaryText,
    String iconName = "",
    double width = 16,
    double height = 16}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontFamily: 'GothamMedium',
          fontSize: 20,
        ),
      ),
      Container(
        // width: 24,
        margin: EdgeInsets.only(left: 17.w),
        child: appImage(
          imagePath: iconName,
          width: width,
          height: height,
        ),
      ),
    ],
  );
}

Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}
