import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/models/contact_Us.dart';
import 'package:gomobilez/services/userService.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class ContactUsViewModel extends BaseViewModel {
  UserService _userService = locator<UserService>();

  Future<ContactUs?> getContactUs() async {
    try {
      http.Response response = await _userService.getContactUs();

      if (response.statusCode == 200) {
        ContactUs contactUs = contactUsFromJson(response.body);
        print(response.body);
        notifyListeners();
        return contactUs;
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
}
