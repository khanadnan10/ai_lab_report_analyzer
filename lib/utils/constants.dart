import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  /// ENV
  static final supabaseUrl = dotenv.get('SUPABASE_URL');
  static final supabaseAnonKey = dotenv.get('SUPABASE_ANON_KEY');
}
