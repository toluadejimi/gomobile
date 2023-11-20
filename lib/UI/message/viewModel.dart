import 'dart:convert';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:gomobilez/UI/message/getNumber/index.dart';
import 'package:gomobilez/UI/message/getNumber/phoneView.dart';
import 'package:gomobilez/UI/message/getNumber/success.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/responseHandlers.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/conversation.dart';
import 'package:gomobilez/models/messageHistory.dart';
import 'package:gomobilez/models/numbers.dart';
import 'package:gomobilez/services/messageService.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';
import '../dashboard/viewModel.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class MessageViewModel extends DashBoardViewModel {
  final MessageService _messageService = locator<MessageService>();

  int _getNumberIndex = 0;
  int get getNumberIndex => _getNumberIndex;
  setGetNumberIndex(int val) {
    _getNumberIndex = val;
    notifyListeners();
  }

  Country? _selectedCountry;
  Country? get selectedCountry => _selectedCountry;

  setSelectedCountry(Country val) {
    _selectedCountry = val;
    notifyListeners();
  }

  // String _selectedNumber = '';
  // String get selectedNumber => _selectedNumber;

  // setSelectedNumber(String val) {
  //   _selectedNumber = val;
  //   notifyListeners();
  // }

  init(context, model) async {
    User? _user = await user;
    print(user);
    if (_user != null) {
      if (_user.myNumber == null ||
          _user.myNumber!.phoneNo == null ||
          _user.myNumber!.phoneNo!.isEmpty) {
        showButtomModalSheet(context: context, child: GetNumber(model: model));
      } else {}
    }
  }

  Future<Number?> getNumbers() async {
    if (selectedCountry != null) {
      try {
        var data = {"code": selectedCountry!.countryCode.toUpperCase()};
        http.Response response = await _messageService.getNumbers(data);
        var raw = jsonDecode(response.body);

        if (raw['status'] == true) {
          Number number = numberFromJson(jsonEncode(raw['data']));
          return number;
        } else {
          return null;
        }
      } catch (e) {
        errorHandler(e);
        return null;
      }
    } else {
      return null;
    }
  }

  Future buyNumber(String selectedNumber, BuildContext context) async {
    if (selectedNumber.isNotEmpty) {
      try {
        var data = {"phone_no": selectedNumber};
        http.Response response = await _messageService.buyNumber(data);
        String? dataAfterResponseHandler = responseHandler(response);

        if (dataAfterResponseHandler != null) {
          var raw = jsonDecode(dataAfterResponseHandler);

          print(raw);

          if (raw['status'] == true) {
            showButtomModalSheet(
                context: context,
                child: Success(
                    close: onCloseSuccess, message: raw['data']['message']));
          } else {
            return null;
          }
        } else {
          return null;
        }
      } catch (e) {
        errorHandler(e);
        return null;
      }
    } else {
      errorHandler({"message": 'No Phone number selected'});
      return null;
    }
  }

  onCloseSuccess() async {
    navigationService.back();
    navigationService.back();
    navigationService.back();
    await refreshUser();
  }

  onCloseCountryModal(context) {
    showFlexibleBottomSheet(
      bottomSheetColor: white,
      bottomSheetBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: (BuildContext context, ScrollController scrollController,
              double bottomSheetOffset) =>
          NumberView(
              future: getNumbers,
              scrollController: scrollController,
              buyNumber: buyNumber),
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  getAnActiveNumber(context, model) {
    displayCountryPicker(context, setSelectedCountry, onCloseCountryModal);
  }

  Future<List<MessageHistory>?> getRecentMessages() async {
    try {
      http.Response response = await _messageService.getRecentMessages();
      var raw = jsonDecode(response.body);

      print(raw);

      if (raw['status'] == true) {
        List<MessageHistory> history = [];
        if (raw['data'].length > 0) {
          for (var i = 0; i < raw['data'].length; i++) {
            history.add(messageHistoryFromJson(jsonEncode(raw['data'][i])));
          }
        }
        return history;
      } else {
        return null;
      }
    } catch (e) {
      errorHandler(e);
      return null;
    }
  }

  navigateToDeviceContactPage() {
    navigationService.navigateTo(Routes.deviceContactView,
        arguments: DeviceContactViewArguments(
            title: "New conversation",
            click: navigateToConversationPageFromDeviceContact));
  }

  void navigateToConversationPageFromDeviceContact(Contact contact) {
    navigationService.navigateToConversationView(
        phoneNumber: contact.phones[0].normalizedNumber,
        name: contact.displayName);
  }

  void navigateToConversationPage(String phoneNumber, name) {
    navigationService.navigateToConversationView(
        phoneNumber: phoneNumber, name: name, newConversation: false);
  }

  Future<List<Conversation?>?> getCoversation(String phoneNumber, {name = ''}) async {
    try {
      var data = {"phone_no": phoneNumber.standardPhoneNumberFormart(), "name": name};
      http.Response response = await _messageService.getConversation(data);
      var raw = jsonDecode(response.body);

      print(raw);

      if (raw['status'] == true) {
        List<Conversation> conversation = [];
        if (raw['data'].length > 0) {
          for (var i = 0; i < raw['data'].length; i++) {
            conversation.add(conversationFromJson(jsonEncode(raw['data'][i])));
          }
        }
        return conversation.reversed.toList();
      } else {
        return null;
      }
    } catch (e) {
      errorHandler(e);
      return null;
    }
  }
}
