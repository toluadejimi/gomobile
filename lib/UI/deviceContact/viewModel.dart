import 'dart:async';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:permission_handler/permission_handler.dart';

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
    Contact contact = Contact(
        id: '1',
        phones: [Phone(number: number.replaceFirst('0', '+234'), label: "")],
        emails: const [],
        structuredName:
            StructuredName.fromMap(const {"displayName": "UNKNOWN"}),
        organization: null);
    action(contact);
  }

  getDeviceContact() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.contacts].request();
    print(
        "===============contact=====================${statuses[Permission.contacts]}");
    if ((await Permission.contacts.status) != PermissionStatus.denied) {
      List<Contact> contacts = (await FastContacts.getAllContacts()) ?? [];
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
          .where((n) =>
              (n.displayName ?? "").toLowerCase().contains(val.toLowerCase()))
          .toList();
      List<Contact> temp3 = [];
      contact.map((c) {
        return (c.phones ?? []).map((e) {
          if (e.number.contains(val) ||
              e.number.contains(val.replaceFirst('0', '+234'))) {
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
