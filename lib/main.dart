import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled8/app.dart';

import 'config/config.dart';
import 'global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();

  runApp(const ProviderScope(child: MyApp()));
  await Config.loadConfig();

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
    return const MainPage();
  }
}
