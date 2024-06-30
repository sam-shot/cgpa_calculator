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
    url: 'https://xhknidgfmoiaanrbtadq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhoa25pZGdmbW9pYWFucmJ0YWRxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTkyNzc3MDMsImV4cCI6MjAzNDg1MzcwM30.KlZRAftBaVV754WWLDRbNelmTaIjjib3a4HQf7r1KuI',
  );
  ///// DEP
  locator.registerSingleton<DBService>(DBService());
  locator.registerLazySingleton<AppDialogs>(() => AppDialogs(navigatorKey));
  locator.registerLazySingleton<AppNavigator>(() => AppNavigator(navigatorKey));
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  await locator<DBService>().startHive();
}
