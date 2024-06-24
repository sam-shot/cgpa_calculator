import 'package:cgpa_calculator/core/services/db_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  
  ///// DEP
  locator.registerSingleton<DBService>(DBService());
  await locator<DBService>().startHive();
  
}
