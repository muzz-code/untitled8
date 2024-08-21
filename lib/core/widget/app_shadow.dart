import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../utils/images_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? boxBorder,
  BorderRadius? borderRadius,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.h), topRight: Radius.circular(20.h)),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  bool? inputValidity,
}) {
  Color borderColor = (inputValidity ?? true)
      ? AppColors.primaryFourthElementText
      : AppColors.danger;

  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;

  const AppBoxDecorationImage(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.imagePath = ImageRes.giftCardsImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              imagePath,
            ),
          ),
          borderRadius: BorderRadius.circular(10.w)),
    );
  }
}
