import 'package:get_it/get_it.dart';
import 'package:gomobilez/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // var lsInstance = await LocalStorageService.getInstance();
  locator.registerLazySingleton(() => MyNavigationService());
}
