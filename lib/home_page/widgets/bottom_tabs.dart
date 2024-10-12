import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/authentication/screens/homepage.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/images_res.dart';
import '../../core/widget/image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/images/home.png'),
      activeIcon: bottomContainer(
          color: AppColors.white, imagePath: 'assets/images/home.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Home'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/images/more_grid.png'),
      activeIcon: bottomContainer(
          color: AppColors.white,
          imagePath: 'assets/images/more_grid.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Payment'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/images/vector.png'),
      activeIcon: bottomContainer(
          color: AppColors.white,
          imagePath: 'assets/images/vector.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'Support'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/images/settings.png'),
      activeIcon: bottomContainer(
          color: AppColors.white,
          imagePath: 'assets/images/settings.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'More'),
  BottomNavigationBarItem(
      icon: bottomContainer(imagePath: 'assets/images/arrow.png'),
      activeIcon: bottomContainer(
          color: AppColors.white,
          imagePath: 'assets/images/arrow.png'),
      backgroundColor: AppColors.primaryBackground,
      label: 'More'),
];

Widget bottomContainer(
    {double width = 17,
    double height = 17,
    String? imagePath,
    Color color = AppColors.black}) {
  return SizedBox(
    width: width.w,
    height: height.w,
    child: appImageWithColor(imagePath: imagePath ?? "", color: color),
  );
}

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    const HomePageScreen(),
    Container(
      color: Colors.black,
      child: Center(
        child: appImage(
            imagePath: ImageRes.moreGridImgIcon, width: 250, height: 250),
      ),
    ),
    Container(
      color: Colors.black,
      child: Center(
        child:
            appImage(imagePath: ImageRes.arrowImgIcon, width: 250, height: 250),
      ),
    ),
    Container(
      color: Colors.black,
      child: Center(
        child: appImage(
            imagePath: ImageRes.vectorImgIcon, width: 250, height: 250),
      ),
    ),
    Container(
      color: Colors.black,
      child: Center(
        child: appImage(
            imagePath: ImageRes.settingsImgIcon, width: 250, height: 250),
      ),
    ),
  ];
  return screens[index];
}
