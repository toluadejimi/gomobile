import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:gomobilez/UI/message/getNumber/index.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/models/home_widget.dart';
import 'package:gomobilez/models/plans.dart';
import 'package:gomobilez/services/settingsService.dart';
import 'package:http/http.dart'as http;

class HomeViewModel extends ContactViewModel {
  ScrollController listViewController = ScrollController();
  ScrollController listViewController2 = ScrollController();
  TextEditingController searchController = TextEditingController();

  SettingsService _settingsService = locator<SettingsService>();

  init() {
    getPlans();
  }

  List homeWidgetList = [
    HomeWidget(
        picture: "assets/images/svg/bxs_phone-call.svg",
        title: "Make a Call",
        description: "Make a Call\nfrom dial pad",
        click: 'callPage'),
    HomeWidget(
        picture: "assets/images/svg/bxs_contact.svg",
        title: " Call Friends and Family ",
        description: "Call anyone on your\naddress book",
        click: 'contactPage'),
    HomeWidget(
        picture: "assets/images/svg/bi_send-arrow-up-fill.svg",
        title: "Send a top up",
        description: "Send to up to\nfamily and friends",
        click: 'topUp'),
    HomeWidget(
        picture: "assets/images/svg/vaadin_money-exchange.svg",
        title: "Send and Receive Money",
        description: "Send and receive money\nacross borders",
        click: 'sendMoney'),
  ];

  Future<Plans>? _plans = null;
  Future<Plans>? get plans => _plans;
  setPlans(Future<Plans>? val) {
    _plans = val;
    notifyListeners();
  }

  navigateToFundWallet() {
    navigationService.navigateTo(Routes.walletView,
        arguments: WalletViewArguments(canPop: true));
  }

  reservePhoneNumber(context) {
    showButtomModalSheet(
        context: context, child: GetNumber(model: MessageViewModel()));
  }

  navigateToContactPage() {
    navigationService.navigateToDeviceContactView(
        title: 'Contact', click: navigateToCallPage);
  }

  navigateToSendMoneyPage() {
    navigationService.navigateTo('/send-and-receive-money-view');
  }

  void navigateToCallPage(Contact contact) {
    // navigationService.navigateToConversationView(contact: contact);
    makeCall(contact.phones[0].normalizedNumber, name: contact.displayName);
  }

  navigate(String to) {
    switch (to) {
      case 'contactPage':
        return navigateToContactPage();
        // ignore: dead_code
        break;
      case 'sendMoney':
        return navigateToSendMoneyPage();
        // ignore: dead_code
        break;
      case 'callPage':
        return navigationService.navigateToContactView(canPop: true);
        // ignore: dead_code
        break;
      default:
        return () {};
    }
  }

   getPlans() async {
    try {
      http.Response response = await _settingsService.getPlans();
      String? dataAfterResponseHandler = response.body;

      var raw = jsonDecode(dataAfterResponseHandler);

      if (raw['status'] == true) {
        Plans data = plansFromJson(jsonEncode(raw['data']));

        setPlans(Future.value(data));
      }
    } catch (e) {
      errorHandler(e);
    }
  }
}
