import 'package:get_it/get_it.dart';
import '../lib2/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // var lsInstance = await LocalStorageService.getInstance();
  locator.registerLazySingleton(() => MyNavigationService());
}
