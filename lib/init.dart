import 'package:ai_lab_report_analyzer/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  /// env initialization
  await dotenv.load(fileName: '.env');

  /// Register supabase
  final sb.Supabase supabase =
      await sb.Supabase.initialize(
        url: Constants.supabaseUrl,
        anonKey: Constants.supabaseAnonKey,
      ).whenComplete(() => debugPrint('🤖 Database Connected')).catchError((
        e,
        _,
        // ignore: body_might_complete_normally_catch_error
      ) {
        debugPrint('💀 Database ConnectionERROR');
        FlutterError.dumpErrorToConsole(
          FlutterErrorDetails(exception: e.toString()),
        );
      });

  /// service locator
  serviceLocator.registerLazySingleton(() {
    return supabase.client;
  });

  ///
}
