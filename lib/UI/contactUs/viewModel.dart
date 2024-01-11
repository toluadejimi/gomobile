import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/models/contact_Us.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:http/http.dart' as http;

class ContactUsViewModel extends AppBaseViewModel {
  UserService _userService = locator<UserService>();

  init(){
    getContactUs();
  }

  Future<ContactUs>? _contactUs = null;
  Future<ContactUs>? get contactUs => _contactUs;
  setContactUs(Future<ContactUs>? val) {
    _contactUs = val;
    notifyListeners();
  }

  getContactUs() async {
    try {
      http.Response response = await _userService.getContactUs();

      if (response.statusCode == 200) {
        ContactUs rawContactUs = contactUsFromJson(response.body);
        print(response.body);
        notifyListeners();
        setContactUs(Future.value(rawContactUs));
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Res');
      }
    } catch (error) {
      throw Exception('Failed to load contact information');
    }
    return null;
  }
  onClickCall() async {
    ContactUs? rawContact = await contactUs;
    if (rawContact != null) {
    copyTextToClipboard(rawContact.data.phoneNo);
    }
  }

  onClickMail() async {
    ContactUs? rawContact = await contactUs;
    if (rawContact != null) {
      copyTextToClipboard(rawContact.data.email);
    }
  }
}
