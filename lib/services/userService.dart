import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class UserService extends Services {
  Future<http.Response> getUser() async {
    http.Response response = await get('get-user', isAuth: true);
    return response;
  }

  Future<http.Response> getSavedCards() async {
    http.Response response = await get('saved-cards', isAuth: true);
    return response;
  }
  Future<http.Response> getContactUs() async {
    http.Response response = await get('contact-us', isAuth: true);
    return response;
  }
}
