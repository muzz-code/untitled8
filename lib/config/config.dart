import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

abstract class Config {
  static String baseUrl = DotEnv.dotenv.env['BASE_URL'] ?? "";
  static String xClient = DotEnv.dotenv.env['MOBILE_INTERNAL_CLIENT'] ?? "";
  static String? correlationId = DotEnv.dotenv.env['correlationId'];
  static String? login = DotEnv.dotenv.env['login'];

  static Future<void> loadConfig() async {
    const String env = String.fromEnvironment('app.env');
    String envFile;
    if (env.isEmpty) {
      envFile = 'env/development.env';
    } else {
      envFile = 'env/$env.env';
    }
    await DotEnv.dotenv.load(fileName: envFile);
  }

  static String generateRandomString(int len) {
    var random = Random.secure();
    var bytes = List.generate(len, (index) => random.nextInt(256));
    var digest = sha256.convert(bytes);
    return base64Url.encode(digest.bytes).substring(0, len);
  }
}
