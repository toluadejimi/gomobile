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
  Future<http.Response> removeSavedCards(data) async {
    http.Response response = await post('delete-card', isAuth: true, body: data);
    return response;
  }
  Future<http.Response> getContactUs() async {
    http.Response response = await get('contact-us', isAuth: true);
    return response;
  }
  Future<http.Response> cancelSubscription(data) async {
    http.Response response = await post('cancle-subscription', isAuth: true, body: data);
    return response;
  }
  Future<http.Response> subscribeAgain(data) async {
    http.Response response = await post('resubscribe', isAuth: true, body: data);
    return response;
  }
  Future<http.Response> subscribe(data) async {
    http.Response response = await post('subscribe', isAuth: true, body: data);
    return response;
  }
}
