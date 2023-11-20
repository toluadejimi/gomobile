// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_shared/stacked_shared.dart';

import '../services/authService.dart';
import '../services/contactService.dart';
import '../services/index.dart';
import '../services/localStorageService.dart';
import '../services/messageService.dart';
import '../services/paymentService.dart';
import '../services/tokenService.dart';
import '../services/userService.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => Services());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => TokenService());
  locator.registerLazySingleton(() => ContactService());
  locator.registerLazySingleton(() => PaymentService());
  locator.registerLazySingleton(() => MessageService());
  locator.registerLazySingleton(() => UserService());
}
