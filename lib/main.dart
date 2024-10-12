import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/app.dart';
import 'package:untitled8/splash_screen.dart';

import 'config/config.dart';
import 'core/route/router.dart';
import 'core/utils/app_theme.dart';
import 'global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();

  runApp(const ProviderScope(child: MyApp()));
  // await Config.loadConfig();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          initialRoute: SplashScreens.routeName,
          title: 'Flutter Demo',
          theme: AppTheme.appThemeData,
          onGenerateRoute: Routers.generateRoute,
        ));
  }
}
