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

AppBar customAppBar(
    BuildContext context,
    String appBarText, {
      String? iconName,
      bool? prefixedImage,
    }) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Container(
      padding: const EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Row(
        children: [
          if (prefixedImage ?? false) // Show the container only if prefixedImage is true
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  // child: appImage(imagePath: iconName ?? ""),
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
            ),
          text18Heading(text: appBarText, color: AppColors.black),
          const Spacer(),
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


