import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class DeviceContactViewModel extends AppBaseViewModel {
  Future<List<Contact>?> getDeviceContact() async {
    FlutterContacts.config.includeNotesOnIos13AndAbove = true;
    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      return contacts;
    }else{
      return null;
    }
  }
}
