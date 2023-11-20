import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class ContactService extends Services {
  Future<http.Response> getContactHistory(data) async {
    http.Response response =
        await post('contact-history', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> makeCall(data) async {
    http.Response response =
        await post('initiate-call', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> getRecentCall() async {
    http.Response response =
        await get('recent-call', isAuth: true);
    return response;
  }
}
