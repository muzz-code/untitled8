import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'core/storage/storage.dart';


class Global {
  static late StorageService storageService;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    storageService = await StorageService().init();
    print('checking storage service');
  }
}
