// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i25;
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart' as _i26;
import 'package:gomobilez/UI/auth/forgotPassword/index.dart' as _i6;
import 'package:gomobilez/UI/auth/getStarted/view.dart' as _i3;
import 'package:gomobilez/UI/auth/signIn/index.dart' as _i5;
import 'package:gomobilez/UI/auth/signUp/index.dart' as _i4;
import 'package:gomobilez/UI/contact/view.dart' as _i11;
import 'package:gomobilez/UI/contactUs/view.dart' as _i17;
import 'package:gomobilez/UI/dashboard/view.dart' as _i7;
import 'package:gomobilez/UI/deviceContact/view.dart' as _i19;
import 'package:gomobilez/UI/home/view.dart' as _i8;
import 'package:gomobilez/UI/legalTerms/view.dart' as _i18;
import 'package:gomobilez/UI/manageDebitAndCredit/view.dart' as _i21;
import 'package:gomobilez/UI/manageSubscription/subsciptionPlanView.dart'
    as _i24;
import 'package:gomobilez/UI/manageSubscription/view.dart' as _i15;
import 'package:gomobilez/UI/message/conversation/conversationView.dart'
    as _i20;
import 'package:gomobilez/UI/message/view.dart' as _i9;
import 'package:gomobilez/UI/sendAndReceiveMoney/view.dart' as _i22;
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/view.dart' as _i23;
import 'package:gomobilez/UI/settings/view.dart' as _i12;
import 'package:gomobilez/UI/startUp/appBaseScreen.dart' as _i2;
import 'package:gomobilez/UI/updatePassword/view.dart' as _i16;
import 'package:gomobilez/UI/updateProfile/view.dart' as _i14;
import 'package:gomobilez/UI/wallet/view.dart' as _i10;
import 'package:gomobilez/UI/WebPage/view.dart' as _i13;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i27;

class Routes {
  static const appBaseScreen = '/app-base-screen';

  static const getStartedView = '/get-started-view';

  static const signUpView = '/sign-up-view';

  static const loginView = '/login-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const dashBoardView = '/dash-board-view';

  static const homeView = '/home-view';

  static const messageView = '/message-view';

  static const walletView = '/wallet-view';

  static const contactView = '/contact-view';

  static const settingsView = '/settings-view';

  static const webPageView = '/web-page-view';

  static const updateProfileView = '/update-profile-view';

  static const manageSubscriptionView = '/manage-subscription-view';

  static const updatePasswordView = '/update-password-view';

  static const contactUsView = '/contact-us-view';

  static const legalTermsView = '/legal-terms-view';

  static const deviceContactView = '/device-contact-view';

  static const conversationView = '/conversation-view';

  static const manageDebitAndCreditView = '/manage-debit-and-credit-view';

  static const sendAndReceiveMoneyView = '/send-and-receive-money-view';

  static const sendMoneyToGomoblieUsersView =
      '/send-money-to-gomoblie-users-view';

  static const subsciptionPlanView = '/subsciption-plan-view';

  static const all = <String>{
    appBaseScreen,
    getStartedView,
    signUpView,
    loginView,
    forgotPasswordView,
    dashBoardView,
    homeView,
    messageView,
    walletView,
    contactView,
    settingsView,
    webPageView,
    updateProfileView,
    manageSubscriptionView,
    updatePasswordView,
    contactUsView,
    legalTermsView,
    deviceContactView,
    conversationView,
    manageDebitAndCreditView,
    sendAndReceiveMoneyView,
    sendMoneyToGomoblieUsersView,
    subsciptionPlanView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.appBaseScreen,
      page: _i2.AppBaseScreen,
    ),
    _i1.RouteDef(
      Routes.getStartedView,
      page: _i3.GetStartedView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i4.SignUpView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.dashBoardView,
      page: _i7.DashBoardView,
    ),
    // _i1.RouteDef(
    //   Routes.homeView,
    //   page: _i8.HomeView,
    // ),
    _i1.RouteDef(
      Routes.messageView,
      page: _i9.MessageView,
    ),
    // _i1.RouteDef(
    //   Routes.walletView,
    //   page: _i10.WalletView,
    // ),
    _i1.RouteDef(
      Routes.contactView,
      page: _i11.ContactView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i12.SettingsView,
    ),
    _i1.RouteDef(
      Routes.webPageView,
      page: _i13.WebPageView,
    ),
    _i1.RouteDef(
      Routes.updateProfileView,
      page: _i14.UpdateProfileView,
    ),
    _i1.RouteDef(
      Routes.manageSubscriptionView,
      page: _i15.ManageSubscriptionView,
    ),
    _i1.RouteDef(
      Routes.updatePasswordView,
      page: _i16.UpdatePasswordView,
    ),
    _i1.RouteDef(
      Routes.contactUsView,
      page: _i17.ContactUsView,
    ),
    _i1.RouteDef(
      Routes.legalTermsView,
      page: _i18.LegalTermsView,
    ),
    _i1.RouteDef(
      Routes.deviceContactView,
      page: _i19.DeviceContactView,
    ),
    _i1.RouteDef(
      Routes.conversationView,
      page: _i20.ConversationView,
    ),
    _i1.RouteDef(
      Routes.manageDebitAndCreditView,
      page: _i21.ManageDebitAndCreditView,
    ),
    _i1.RouteDef(
      Routes.sendAndReceiveMoneyView,
      page: _i22.SendAndReceiveMoneyView,
    ),
    _i1.RouteDef(
      Routes.sendMoneyToGomoblieUsersView,
      page: _i23.SendMoneyToGomoblieUsersView,
    ),
    _i1.RouteDef(
      Routes.subsciptionPlanView,
      page: _i24.subsciptionPlanView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.AppBaseScreen: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.AppBaseScreen(),
        settings: data,
      );
    },
    _i3.GetStartedView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.GetStartedView(),
        settings: data,
      );
    },
    _i4.SignUpView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignUpView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.DashBoardView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DashBoardView(),
        settings: data,
      );
    },
    // _i8.HomeView: (data) {
    //   final args = data.getArgs<HomeViewArguments>(nullOk: false);
    //   return _i25.MaterialPageRoute<dynamic>(
    //     builder: (context) =>
    //         _i8.HomeView(key: args.key, pageController: args.pageController),
    //     settings: data,
    //   );
    // },
    _i9.MessageView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.MessageView(),
        settings: data,
      );
    },
    // _i10.WalletView: (data) {
    //   final args = data.getArgs<WalletViewArguments>(
    //     orElse: () => const WalletViewArguments(),
    //   );
    //   return _i25.MaterialPageRoute<dynamic>(
    //     builder: (context) =>
    //         _i10.WalletView(key: args.key, canPop: args.canPop),
    //     settings: data,
    //   );
    // },
    _i11.ContactView: (data) {
      final args = data.getArgs<ContactViewArguments>(
        orElse: () => const ContactViewArguments(),
      );
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.ContactView(key: args.key, canPop: args.canPop),
        settings: data,
      );
    },
    _i12.SettingsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SettingsView(),
        settings: data,
      );
    },
    _i13.WebPageView: (data) {
      final args = data.getArgs<WebPageViewArguments>(nullOk: false);
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.WebPageView(key: args.key, url: args.url),
        settings: data,
      );
    },
    _i14.UpdateProfileView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.UpdateProfileView(),
        settings: data,
      );
    },
    _i15.ManageSubscriptionView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ManageSubscriptionView(),
        settings: data,
      );
    },
    _i16.UpdatePasswordView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.UpdatePasswordView(),
        settings: data,
      );
    },
    _i17.ContactUsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.ContactUsView(),
        settings: data,
      );
    },
    _i18.LegalTermsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.LegalTermsView(),
        settings: data,
      );
    },
    _i19.DeviceContactView: (data) {
      final args = data.getArgs<DeviceContactViewArguments>(nullOk: false);
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.DeviceContactView(
            key: args.key, title: args.title, click: args.click),
        settings: data,
      );
    },
    _i20.ConversationView: (data) {
      final args = data.getArgs<ConversationViewArguments>(nullOk: false);
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.ConversationView(
            key: args.key,
            phoneNumber: args.phoneNumber,
            name: args.name,
            newConversation: args.newConversation),
        settings: data,
      );
    },
    _i21.ManageDebitAndCreditView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ManageDebitAndCreditView(),
        settings: data,
      );
    },
    _i22.SendAndReceiveMoneyView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.SendAndReceiveMoneyView(),
        settings: data,
      );
    },
    _i23.SendMoneyToGomoblieUsersView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.SendMoneyToGomoblieUsersView(),
        settings: data,
      );
    },
    _i24.subsciptionPlanView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.subsciptionPlanView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.pageController,
  });

  final _i25.Key? key;

  final _i25.PageController pageController;

  @override
  String toString() {
    return '{"key": "$key", "pageController": "$pageController"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.pageController == pageController;
  }

  @override
  int get hashCode {
    return key.hashCode ^ pageController.hashCode;
  }
}

class WalletViewArguments {
  const WalletViewArguments({
    this.key,
    this.canPop = false,
  });

  final _i25.Key? key;

  final bool canPop;

  @override
  String toString() {
    return '{"key": "$key", "canPop": "$canPop"}';
  }

  @override
  bool operator ==(covariant WalletViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.canPop == canPop;
  }

  @override
  int get hashCode {
    return key.hashCode ^ canPop.hashCode;
  }
}

class ContactViewArguments {
  const ContactViewArguments({
    this.key,
    this.canPop = false,
  });

  final _i25.Key? key;

  final bool canPop;

  @override
  String toString() {
    return '{"key": "$key", "canPop": "$canPop"}';
  }

  @override
  bool operator ==(covariant ContactViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.canPop == canPop;
  }

  @override
  int get hashCode {
    return key.hashCode ^ canPop.hashCode;
  }
}

class WebPageViewArguments {
  const WebPageViewArguments({
    this.key,
    required this.url,
  });

  final _i25.Key? key;

  final String url;

  @override
  String toString() {
    return '{"key": "$key", "url": "$url"}';
  }

  @override
  bool operator ==(covariant WebPageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.url == url;
  }

  @override
  int get hashCode {
    return key.hashCode ^ url.hashCode;
  }
}

class DeviceContactViewArguments {
  const DeviceContactViewArguments({
    this.key,
    required this.title,
    required this.click,
  });

  final _i25.Key? key;

  final String title;

  final void Function(_i26.Contact) click;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "click": "$click"}';
  }

  @override
  bool operator ==(covariant DeviceContactViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.title == title && other.click == click;
  }

  @override
  int get hashCode {
    return key.hashCode ^ title.hashCode ^ click.hashCode;
  }
}

class ConversationViewArguments {
  const ConversationViewArguments({
    this.key,
    required this.phoneNumber,
    required this.name,
    this.newConversation = true,
  });

  final _i25.Key? key;

  final String phoneNumber;

  final String name;

  final bool newConversation;

  @override
  String toString() {
    return '{"key": "$key", "phoneNumber": "$phoneNumber", "name": "$name", "newConversation": "$newConversation"}';
  }

  @override
  bool operator ==(covariant ConversationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.phoneNumber == phoneNumber &&
        other.name == name &&
        other.newConversation == newConversation;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        phoneNumber.hashCode ^
        name.hashCode ^
        newConversation.hashCode;
  }
}

extension NavigatorStateExtension on _i27.NavigationService {
  Future<dynamic> navigateToAppBaseScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.appBaseScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGetStartedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.getStartedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashBoardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashBoardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView({
    _i25.Key? key,
    required _i25.PageController pageController,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, pageController: pageController),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMessageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.messageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletView({
    _i25.Key? key,
    bool canPop = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.walletView,
        arguments: WalletViewArguments(key: key, canPop: canPop),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactView({
    _i25.Key? key,
    bool canPop = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.contactView,
        arguments: ContactViewArguments(key: key, canPop: canPop),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebPageView({
    _i25.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webPageView,
        arguments: WebPageViewArguments(key: key, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.updateProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToManageSubscriptionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.manageSubscriptionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdatePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.updatePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLegalTermsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.legalTermsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeviceContactView({
    _i25.Key? key,
    required String title,
    required void Function(_i26.Contact) click,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.deviceContactView,
        arguments:
            DeviceContactViewArguments(key: key, title: title, click: click),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConversationView({
    _i25.Key? key,
    required String phoneNumber,
    required String name,
    bool newConversation = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.conversationView,
        arguments: ConversationViewArguments(
            key: key,
            phoneNumber: phoneNumber,
            name: name,
            newConversation: newConversation),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToManageDebitAndCreditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.manageDebitAndCreditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSendAndReceiveMoneyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sendAndReceiveMoneyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSendMoneyToGomoblieUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sendMoneyToGomoblieUsersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSubsciptionPlanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.subsciptionPlanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppBaseScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.appBaseScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGetStartedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.getStartedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashBoardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashBoardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i25.Key? key,
    required _i25.PageController pageController,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, pageController: pageController),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMessageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.messageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalletView({
    _i25.Key? key,
    bool canPop = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.walletView,
        arguments: WalletViewArguments(key: key, canPop: canPop),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactView({
    _i25.Key? key,
    bool canPop = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.contactView,
        arguments: ContactViewArguments(key: key, canPop: canPop),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWebPageView({
    _i25.Key? key,
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.webPageView,
        arguments: WebPageViewArguments(key: key, url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpdateProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.updateProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithManageSubscriptionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.manageSubscriptionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpdatePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.updatePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLegalTermsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.legalTermsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDeviceContactView({
    _i25.Key? key,
    required String title,
    required void Function(_i26.Contact) click,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.deviceContactView,
        arguments:
            DeviceContactViewArguments(key: key, title: title, click: click),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConversationView({
    _i25.Key? key,
    required String phoneNumber,
    required String name,
    bool newConversation = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.conversationView,
        arguments: ConversationViewArguments(
            key: key,
            phoneNumber: phoneNumber,
            name: name,
            newConversation: newConversation),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithManageDebitAndCreditView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.manageDebitAndCreditView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSendAndReceiveMoneyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sendAndReceiveMoneyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSendMoneyToGomoblieUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sendMoneyToGomoblieUsersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSubsciptionPlanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.subsciptionPlanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
