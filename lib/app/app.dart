
import 'package:gomobilez/UI/Profile/view.dart';
import 'package:gomobilez/UI/auth/signIn/index.dart';
import 'package:gomobilez/UI/auth/signUp/index.dart';
import 'package:gomobilez/UI/chat/view.dart';
import 'package:gomobilez/UI/dashboard/view.dart';
import 'package:gomobilez/UI/home/index.dart';
import 'package:gomobilez/UI/startUp/appBaseScreen.dart';
import 'package:gomobilez/services/authservice.dart';
import 'package:gomobilez/services/index.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:stacked/stacked_annotations.dart';

// dart run build_runner build --delete-conflicting-outputs
//  stk

@StackedApp(
  routes: [
    // MaterialRoute(page: SplashScreen, initial: true ),
    
    MaterialRoute(page: AppBaseScreen),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: DashBoardView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ChatView),
    MaterialRoute(page: ProfileView),
  ],
  dependencies: [
    LazySingleton(classType: Services),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalStorageService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
