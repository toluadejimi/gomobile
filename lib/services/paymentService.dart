import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class PaymentService extends Services {
  Future<http.Response> fundAccount(data) async {
    http.Response response = await post('pay-now', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> fundAccountWithCard(data) async {
    http.Response response =
        await post('charge-saved-cards', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> getRecentTransaction() async {
    http.Response response = await get('all-transaction', isAuth: true);
    return response;
  }

  Future<http.Response> verifyAccount(data) async {
    http.Response response =
        await post('verify-account', isAuth: true, body: data);
    return response;
  }

   Future<http.Response> getConversionRate(data) async {
    http.Response response =
        await post('conversion-rate', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> sendMoneyToGomobileUser(data) async {
    http.Response response =
        await post('send-to-inapp', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> sendMoneyToBank(data) async {
    http.Response response =
        await post('send-to-bank', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> createPin(data) async {
    http.Response response =
        await post('create-transfer-pin', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> verifyEmail(data) async {
    http.Response response =
        await post('verify-account', isAuth: true, body: data);
    return response;
  }

   Future<http.Response> getCountries() async {
    http.Response response =
        await get('countries', isAuth: true);
    return response;
  }

   Future<http.Response> getServiceProvider(data) async {
    http.Response response = await post('services', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> getServiceProduct(data) async {
    http.Response response = await post('service-cost', isAuth: true, body:data);
    return response;
  }

  Future<http.Response> buyAirtime(data) async {
    http.Response response =
        await post('buy-airtime', isAuth: true, body: data);
    return response;
  }
}
