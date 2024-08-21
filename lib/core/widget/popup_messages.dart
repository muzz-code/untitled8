import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled8/core/widget/text_widgets.dart';

import '../../core/constants/colors.dart';
import 'image_widgets.dart';

toastInfo(
  String msg, {
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}

Future<dynamic> dialogBuilder(BuildContext context,
    {String? headerText,
      String? dialogDescriptionText,
      String iconName = "",
      double? iconWidth,
      double? iconHeight,
      String? dialogButtonText = "Close",
      String? statusMessage = "status message"}) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Sets the background color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Removes border radius
          ),
          title: Center(
            child: Text(
              "$headerText",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'GothamMedium',
                fontSize: 18,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              appImage(
                imagePath: iconName,
                width: iconWidth ?? 20.0,
                height: iconHeight ?? 20.0,
              ),
              const SizedBox(height: 10),
              Text(
                "$statusMessage",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'GothamMedium',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "$dialogDescriptionText",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'GothamLight',
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Center(
                      child: text15Normal(text: "$dialogButtonText"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  } else if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "$headerText",
            textAlign: TextAlign.center,
          ),
          content: Column(
            children: [
              appImage(
                imagePath: iconName,
                width: iconWidth ?? 20.0,
                height: iconHeight ?? 20.0,
              ),
              const SizedBox(height: 10),
              Text(
                "$statusMessage",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "$dialogDescriptionText",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("$dialogButtonText"),
            ),
          ],
        );
      },
    );
  } else {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Removes border radius
          ),
          title: Center(
            child: Text(
              "$headerText",
              textAlign: TextAlign.center,
            ),
          ),
          content: Text("$dialogDescriptionText"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("$dialogButtonText"),
            ),
          ],
        );
      },
    );
  }
}
