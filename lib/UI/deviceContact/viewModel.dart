import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class DeviceContactViewModel extends AppBaseViewModel {
  TextEditingController searchController = TextEditingController();
  Future<List<Contact>?>? _unfilteredDeviceContact = null;

  Future<List<Contact>?>? _deviceContact = null;
  Future<List<Contact>?>? get deviceContact => _deviceContact;

  Timer? _debounce;
  setDeviceContact(Future<List<Contact>?> val) {
    _deviceContact = val;
    notifyListeners();
  }

  callUnkownNumber(String number, void Function(Contact) action) {
    Contact contact = Contact(displayName: 'Unknown', phones: [
      Phone(number.trim(),
          normalizedNumber:
              number[0] == 0 ? number.replaceFirst('0', '+234') : number)
    ]);
    action(contact);
  }

  getDeviceContact() async {
    FlutterContacts.config.includeNotesOnIos13AndAbove = true;
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      _unfilteredDeviceContact = Future.value(contacts);
      setDeviceContact(Future.value(contacts));
    } else {
      return null;
    }
  }

  filter(String param) async {
    List<Contact>? contact = await _unfilteredDeviceContact;
    String val = param.trim();
    print(contact);
    if (contact != null) {
      var temp = contact
          .where((n) => n.displayName.toLowerCase().contains(val.toLowerCase()))
          .toList();
      List<Contact> temp3 = [];
      contact.map((c) {
        return c.phones.map((e) {
          if (e.number.contains(val) ||
              e.normalizedNumber.contains(val.replaceFirst('0', '+234'))) {
            temp3.add(c);
          }
        }).toList();
      }).toList();
      print(temp3);
      List<Contact> finalList = [...temp, ...temp3];
      setDeviceContact(Future.value(finalList));
    }
  }

  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      filter(query.trim());
    });
  }
}
