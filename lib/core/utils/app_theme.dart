import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class AppTheme{

  static  ThemeData appThemeData = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
              color: AppColors.unionColor
          )
      )
  );
}