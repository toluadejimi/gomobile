// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart' as _i17;
import 'package:gomobilez/UI/auth/forgotPassword/index.dart' as _i6;
import 'package:gomobilez/UI/auth/getStarted/view.dart' as _i3;
import 'package:gomobilez/UI/auth/signIn/index.dart' as _i5;
import 'package:gomobilez/UI/auth/signUp/index.dart' as _i4;
import 'package:gomobilez/UI/contact/view.dart' as _i11;
import 'package:gomobilez/UI/dashboard/view.dart' as _i7;
import 'package:gomobilez/UI/deviceContact/view.dart' as _i14;
import 'package:gomobilez/UI/home/view.dart' as _i8;
import 'package:gomobilez/UI/message/conversation/conversationView.dart'
    as _i15;
import 'package:gomobilez/UI/message/view.dart' as _i9;
import 'package:gomobilez/UI/settings/view.dart' as _i12;
import 'package:gomobilez/UI/startUp/appBaseScreen.dart' as _i2;
import 'package:gomobilez/UI/wallet/view.dart' as _i10;
import 'package:gomobilez/UI/WebPage/view.dart' as _i13;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;

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

  static const deviceContactView = '/device-contact-view';

  static const conversationView = '/conversation-view';

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
    deviceContactView,
    conversationView,
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
    _i1.RouteDef(
      Routes.homeView,
      page: _i8.HomeView,
    ),
    _i1.RouteDef(
      Routes.messageView,
      page: _i9.MessageView,
    ),
    _i1.RouteDef(
      Routes.walletView,
      page: _i10.WalletView,
    ),
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
      Routes.deviceContactView,
      page: _i14.DeviceContactView,
    ),
    _i1.RouteDef(
      Routes.conversationView,
      page: _i15.ConversationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.AppBaseScreen: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.AppBaseScreen(),
        settings: data,
      );
    },
    _i3.GetStartedView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.GetStartedView(),
        settings: data,
      );
    },
    _i4.SignUpView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignUpView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.DashBoardView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DashBoardView(),
        settings: data,
      );
    },
    _i8.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.HomeView(key: args.key, pageController: args.pageController),
        settings: data,
      );
    },
    _i9.MessageView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.MessageView(),
        settings: data,
      );
    },
    _i10.WalletView: (data) {
      final args = data.getArgs<WalletViewArguments>(
        orElse: () => const WalletViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.WalletView(key: args.key, canPop: args.canPop),
        settings: data,
      );
    },
    _i11.ContactView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ContactView(),
        settings: data,
      );
    },
    _i12.SettingsView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SettingsView(),
        settings: data,
      );
    },
    _i13.WebPageView: (data) {
      final args = data.getArgs<WebPageViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.WebPageView(key: args.key, url: args.url),
        settings: data,
      );
    },
    _i14.DeviceContactView: (data) {
      final args = data.getArgs<DeviceContactViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.DeviceContactView(
            key: args.key, title: args.title, click: args.click),
        settings: data,
      );
    },
    _i15.ConversationView: (data) {
      final args = data.getArgs<ConversationViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.ConversationView(
            key: args.key,
            phoneNumber: args.phoneNumber,
            name: args.name,
            newConversation: args.newConversation),
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

  final _i16.Key? key;

  final _i16.PageController pageController;

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

  final _i16.Key? key;

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

class WebPageViewArguments {
  const WebPageViewArguments({
    this.key,
    required this.url,
  });

  final _i16.Key? key;

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

  final _i16.Key? key;

  final String title;

  final void Function(_i17.Contact) click;

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

  final _i16.Key? key;

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

extension NavigatorStateExtension on _i18.NavigationService {
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
    _i16.Key? key,
    required _i16.PageController pageController,
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
    _i16.Key? key,
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

  Future<dynamic> navigateToContactView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactView,
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
    _i16.Key? key,
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

  Future<dynamic> navigateToDeviceContactView({
    _i16.Key? key,
    required String title,
    required void Function(_i17.Contact) click,
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
    _i16.Key? key,
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
    _i16.Key? key,
    required _i16.PageController pageController,
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
    _i16.Key? key,
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

  Future<dynamic> replaceWithContactView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactView,
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
    _i16.Key? key,
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

  Future<dynamic> replaceWithDeviceContactView({
    _i16.Key? key,
    required String title,
    required void Function(_i17.Contact) click,
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
    _i16.Key? key,
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
}
