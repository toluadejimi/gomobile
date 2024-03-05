
import 'package:gomobilez/UI/WebPage/view.dart';
import 'package:gomobilez/UI/auth/getStarted/view.dart';
import 'package:gomobilez/UI/contact/view.dart';
import 'package:gomobilez/UI/settings/view.dart';
import 'package:gomobilez/UI/wallet/view.dart';
import 'package:gomobilez/UI/auth/forgotPassword/index.dart';
import 'package:gomobilez/UI/auth/signIn/index.dart';
import 'package:gomobilez/UI/auth/signUp/index.dart';
import 'package:gomobilez/UI/message/view.dart';
import 'package:gomobilez/UI/dashboard/view.dart';
import 'package:gomobilez/UI/home/view.dart';
import 'package:gomobilez/UI/startUp/appBaseScreen.dart';
import 'package:gomobilez/services/authservice.dart';
import 'package:gomobilez/services/contactService.dart';
import 'package:gomobilez/services/index.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:gomobilez/services/tokenService.dart';
import 'package:stacked/stacked_annotations.dart';

// dart run build_runner build --delete-conflicting-outputs

@StackedApp(
  routes: [
    // MaterialRoute(page: SplashScreen, initial: true ),
    
    MaterialRoute(page: AppBaseScreen),
    MaterialRoute(page: GetStartedView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: DashBoardView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: MessageView),
    MaterialRoute(page: WalletView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: WebPageView),
  ],
  dependencies: [
    LazySingleton(classType: Services),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: TokenService),
    LazySingleton(classType: ContactService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
