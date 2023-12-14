import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/receentCalls.dart';
import 'package:gomobilez/services/contactService.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

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

  getContactHistory() async {
    try {
      http.Response response = await _contactService.getRecentCall();

      var raw = jsonDecode(response.body);
      print(response.body);

      if (raw['status'] == true) {
        List<RecentCalls> transactions = [];
        if (raw['data']['calls'].length > 0) {
          for (var i = 0; i < raw['data']['calls'].length; i++) {
            transactions
                .add(recentCallsFromJson(jsonEncode(raw['data']['calls'][i])));
          }
          setContactHistory(Future.value(transactions));
        } else {
          throw ({'message': 'An error occured'});
        }
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
    await makeCall(contact.phones[0].normalizedNumber,
        name: contact.displayName);
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
          await Permission.microphone.request();
          await Permission.camera.request();

          navigationService.navigateTo(Routes.webPageView,
              arguments: WebPageViewArguments(url: raw['data']['call_url']));
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
