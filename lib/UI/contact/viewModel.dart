import 'dart:convert';
import 'dart:developer';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/receentCalls.dart';
import 'package:gomobilez/services/contactService.dart';
import 'package:http/http.dart' as http;
import 'package:pmvvm/pmvvm.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/telnyx_service.dart';
import '../../widgets/alertify.dart';
import '../call/used_calling_screen.dart';

class ContactViewModel extends DashBoardViewModel {
  ContactService _contactService = locator<ContactService>();
  TextEditingController phoneNumberController = TextEditingController();

  void init() {
    getContactHistory();
  }

  Future<List<RecentCalls>?>? _contactHistory = null;
  Future<List<RecentCalls>?>? get contactHistory => _contactHistory;
  setContactHistory(Future<List<RecentCalls>?> val) {
    _contactHistory = val;
    notifyListeners();
  }

  bool _showFab = false;
  bool get showFab => _showFab;
  setShowFab(bool val) {
    _showFab = val;
    // notifyListeners();
  }

  getContactHistory() async {
    try {
      http.Response response = await _contactService.getRecentCall();

      var raw = jsonDecode(response.body);
      print(response.body);

      if (raw['status'] == true) {
        List<RecentCalls> transactions = [];
        setShowFab(true);
        if (raw['data']['calls'].length > 0) {
          for (var i = 0; i < raw['data']['calls'].length; i++) {
            transactions
                .add(recentCallsFromJson(jsonEncode(raw['data']['calls'][i])));
          }
        }
        setContactHistory(Future.value(transactions));
      } else {
        return null;
      }
    } catch (e) {
      errorHandler(e);
      return null;
    }
  }

  String contactNumber = '';

  navigateBackFromContactScreen(Contact contact) async {
    navigationService.back();
    log(contact.displayName);
    log(contact.phones.toString());
    if (contact.phones.isEmpty) {
      Alertify(title: "Info", message: 'Contact Info Empty').error();
    }
    await makeCall(contact.phones.first.number, name: contact.displayName);
  }

  redial(String url) {
    navigationService.navigateToWebPageView(url: url);
  }

  message(String phoneNumber, String? name) {
    navigationService.navigateToConversationView(
        phoneNumber: phoneNumber,
        name: name != null ? name : phoneNumber,
        newConversation: false);
  }

  makeCall(String number, {String? name}) async {
    if (!Provider.of<TelnyxService>(
            StackedService.navigatorKey!.currentContext!,
            listen: false)
        .registered) {
      Provider.of<TelnyxService>(StackedService.navigatorKey!.currentContext!,
              listen: false)
          .connect();
      Alertify(title: 'Info', message: 'Please try again').warning();
      return;
    }
    if (number.isNotEmpty) {
      try {
        var data = {
          "phone_no": number.standardPhoneNumberFormart(),
          "name": name != null ? name : ''
        };
        http.Response response = await _contactService.makeCall(data);

        var raw = jsonDecode(response.body);
        print(raw);

        if (raw['status'] == true) {
          Navigator.of(StackedService.navigatorKey!.currentContext!)
              .push(MaterialPageRoute(
                  builder: (builder) => APPCallingScreen(
                        phoneNumber: number.standardPhoneNumberFormart(),
                        name: name ?? "UNKNOWN",
                        seconds: raw["data"]['time'].toString(),
                      )));
        } else {
          errorHandler(response.body);
        }
      } catch (e) {
        errorHandler(e);
      }
    }
  }

  pop() {
    navigationService.back();
  }
}
