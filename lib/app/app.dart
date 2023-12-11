
import 'package:gomobilez/UI/WebPage/view.dart';
import 'package:gomobilez/UI/auth/getStarted/view.dart';
import 'package:gomobilez/UI/contact/view.dart';
import 'package:gomobilez/UI/contactUs/view.dart';
import 'package:gomobilez/UI/legalTerms/view.dart';
import 'package:gomobilez/UI/manageDebitAndCredit/view.dart';
import 'package:gomobilez/UI/manageSubscription/subsciptionPlanView.dart';
import 'package:gomobilez/UI/manageSubscription/view.dart';
import 'package:gomobilez/UI/sendAndReceiveMoney/view.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/view.dart';
import 'package:gomobilez/UI/settings/view.dart';
import 'package:gomobilez/UI/updatePassword/view.dart';
import 'package:gomobilez/UI/updateProfile/view.dart';
import 'package:gomobilez/UI/wallet/view.dart';
import 'package:gomobilez/UI/deviceContact/view.dart';
import 'package:gomobilez/UI/message/conversation/conversationView.dart';
import 'package:gomobilez/UI/auth/forgotPassword/index.dart';
import 'package:gomobilez/UI/auth/signIn/index.dart';
import 'package:gomobilez/UI/auth/signUp/index.dart';
import 'package:gomobilez/UI/message/view.dart';
import 'package:gomobilez/UI/dashboard/view.dart';
import 'package:gomobilez/UI/home/view.dart';
import 'package:gomobilez/UI/startUp/appBaseScreen.dart';
import 'package:gomobilez/services/authService.dart';
import 'package:gomobilez/services/contactService.dart';
import 'package:gomobilez/services/firebaseService.dart';
import 'package:gomobilez/services/index.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:gomobilez/services/messageService.dart';
import 'package:gomobilez/services/paymentService.dart';
import 'package:gomobilez/services/tokenService.dart';
import 'package:gomobilez/services/userService.dart';
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
    MaterialRoute(page: UpdateProfileView),
    MaterialRoute(page: ManageSubscriptionView),
    MaterialRoute(page: UpdatePasswordView),
    MaterialRoute(page: ContactUsView),
    MaterialRoute(page: LegalTermsView),
    MaterialRoute(page: DeviceContactView),
    MaterialRoute(page: ConversationView),
    MaterialRoute(page: ManageDebitAndCreditView),
    MaterialRoute(page: SendAndReceiveMoneyView),
    MaterialRoute(page: SendMoneyToGomoblieUsersView),
    MaterialRoute(page: subsciptionPlanView),
  ],
  dependencies: [
    LazySingleton(classType: Services),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: TokenService),
    LazySingleton(classType: ContactService),
    LazySingleton(classType: PaymentService),
    LazySingleton(classType: MessageService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
