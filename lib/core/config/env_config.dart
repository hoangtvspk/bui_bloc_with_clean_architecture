import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> initialize(String environment) async {
    await dotenv.load(fileName: 'lib/core/config/.env.$environment');
  }

  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static bool get shouldShowLogs => dotenv.env['SHOW_LOGS'] == 'true';
} 