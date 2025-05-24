import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:cgpa_calculator/main.dart';
import 'package:cgpa_calculator/ui/utils/app_navigation.dart';
import 'package:cgpa_calculator/ui/utils/dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  await Supabase.initialize(
    debug: kDebugMode,
    url: 'https://dapegreuckurwftbuuqz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRhcGVncmV1Y2t1cndmdGJ1dXF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDgwODQ1OTUsImV4cCI6MjA2MzY2MDU5NX0.wrlRLHcMAP-b1kHmH8sFAvPXUOcYFRxbhbogMpVOCQM',
  );
  ///// DEP
  locator.registerSingleton<DBService>(DBService());
  locator.registerLazySingleton<AppDialogs>(() => AppDialogs(navigatorKey));
  locator.registerLazySingleton<AppNavigator>(() => AppNavigator(navigatorKey));
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  await locator<DBService>().startHive();
}
