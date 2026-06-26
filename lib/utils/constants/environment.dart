import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String supabaseUrl =
      dotenv.env['SUPABASE_URL'] ?? 'La API no esta configurada';
  static String supabasePublishableKey =
      dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? 'La API no esta configurada';
}
