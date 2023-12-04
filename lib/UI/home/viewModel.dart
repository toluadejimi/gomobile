import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:gomobilez/UI/message/getNumber/index.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/models/home_widget.dart';

class HomeViewModel extends ContactViewModel {
  ScrollController listViewController = ScrollController();
  ScrollController listViewController2 = ScrollController();
  TextEditingController searchController = TextEditingController();

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
        break;
      case 'sendMoney':
        return navigateToSendMoneyPage();
      default:
        return () {};
    }
  }
}
