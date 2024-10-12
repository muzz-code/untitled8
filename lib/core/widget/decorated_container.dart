import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

Container buildDecoratedContainer(
    {required double height, required double width, required Color color}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color,
    ),
  );
}

buildCustomContainer() {
  return Center(
    child: Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5), // Semi-transparent background
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            // child: const Center(
            //   child: CircularProgressIndicator(
            //     backgroundColor: Colors.transparent,
            //     color: AppColors.primaryElement,
            //   ),
            // ),
          ),
        ),
      ],
    ),
  );
}