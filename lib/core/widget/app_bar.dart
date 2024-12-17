import 'package:flutter/material.dart';
import 'package:untitled8/core/widget/text_widgets.dart';

import '../constants/colors.dart';
/*
  preferredSize widget gives you a height or space from the appbar downwords and we can
  put child in the given space
 */

AppBar buildAppbar({String title = ""}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: text16Normal(text: title, color: AppColors.primaryColor),
  );
}

AppBar homePageAppBar(BuildContext context, String appBarText,
    {String? iconName,
    bool? prefixedImage,
    Color? backgroundColors,
    Color? fullBackgroundColor,
    Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: fullBackgroundColor ?? Colors.white,
    title: Container(
      padding: const EdgeInsets.only(top: 10.0),
      color: backgroundColors ?? Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (prefixedImage ??
              false) // Show the container only if prefixedImage is true
            Expanded(
              child: Container(
                color: fullBackgroundColor ?? Colors.white,
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    iconName ?? "",
                    width: 35,
                    height: 35,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          text18Heading(text: appBarText, color: textColor ?? AppColors.black),
          const Spacer(),
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  iconName ?? "",
                  width: 35,
                  height: 35,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    toolbarTextStyle: Theme.of(context)
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: Colors.black))
        .bodyMedium,
    centerTitle: true,
    titleTextStyle: Theme.of(context)
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: Colors.black))
        .titleLarge,
  );
}

AppBar signupPageAppBar(BuildContext context, String appBarText,
    {String? iconName,
    bool? prefixedImage,
    Color? backgroundColors,
    Color? fullBackgroundColor,
    Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: fullBackgroundColor ?? Colors.white,
    title: Container(
      padding: const EdgeInsets.only(top: 10.0),
      color: backgroundColors ?? Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (prefixedImage ??
              false) // Show the container only if prefixedImage is true
            Container(
              color: fullBackgroundColor ?? Colors.white,
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  iconName ?? "",
                  width: 35,
                  height: 35,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          const SizedBox(width: 10),
          text14Normal(text: appBarText, color: textColor ?? AppColors.black),
          const Spacer(),
          Expanded(
            child: Container(
              color: fullBackgroundColor ?? Colors.white,
              alignment: Alignment.center,
              child: text14Normal(
                  text: "Sign in instead",
                  color: AppColors.primaryElementBg,
                  allowTextDecoration: true),
            ),
          ),
        ],
      ),
    ),
    toolbarTextStyle: Theme.of(context)
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: Colors.black))
        .bodyMedium,
    centerTitle: true,
    titleTextStyle: Theme.of(context)
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: Colors.black))
        .titleLarge,
  );
}

AppBar customAppBar(BuildContext context, String appBarText,
    {String? iconName,
    bool? prefixedImage,
    bool postFixedImage = true,
    final dynamic Function()? func}) {
  return AppBar(
    scrolledUnderElevation: 0.0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      padding: const EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Row(
        children: [
          if (prefixedImage ??
              false) // Show the container only if prefixedImage is true
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  if (func != null) {
                    await func();
                  }
                },
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      children: [
                        Image.asset(
                          iconName ?? "",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fitWidth,
                        ),
                        text12Normal(text: "Back"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          text18Heading(text: appBarText, color: AppColors.black),
          const Spacer(),
        ],
      ),
    ),
    centerTitle: true,
    toolbarTextStyle: Theme.of(context)
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: Colors.black))
        .bodyMedium,
    titleTextStyle: Theme.of(context)
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: Colors.black))
        .titleLarge,
  );
}
