import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'authentication/screens/login_screen.dart';
import 'core/route/router.dart';
import 'core/utils/app_theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        // darkTheme: darkMode,
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: Routers.generateRoute,
      ),
    );;
  }
}
