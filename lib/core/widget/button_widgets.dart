import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/core/widget/text_widgets.dart';
import '../../core/constants/colors.dart';
import 'app_shadow.dart';

Widget appButton({
  double height = 50,
  String buttonName = "",
  bool isLogin = true,
  BuildContext? context,
  Color? buttonColor,
  Color? textColor,
  dynamic Function()? func,
  WidgetBuilder? pageBuilder,
}) {
  return GestureDetector(
    onTap: () async {
      if (func != null) {
        await func();
      } else if (pageBuilder != null && context != null) {
        await pushFadeInRoute(context, pageBuilder: pageBuilder);
      }
    },
    child: Container(
      width: double.infinity,
      height: height.h,
      decoration: appBoxShadow(
        color: buttonColor ?? Colors.black,
      ),
      child: Center(
          child: text14Medium(
              text: buttonName,
              color: textColor ?? Colors.black)),
    ),
  );
}

Future<T?> pushFadeInRoute<T>(
  BuildContext context, {
  required WidgetBuilder pageBuilder,
}) {
  return Navigator.of(context).push<T>(
    PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) =>
          pageBuilder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}

Widget buttonDots(Color colors) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: 10,
    decoration: BoxDecoration(
      color: colors,
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
