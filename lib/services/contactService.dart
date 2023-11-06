import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class ContactService extends Services {

  Future<http.Response> getContactHistory(data) async {
    http.Response response =
        await post('contact-history', isAuth: false, body: data);
    return response;
  }
  
}