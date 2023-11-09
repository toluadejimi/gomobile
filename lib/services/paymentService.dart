import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class PaymentService extends Services {
  Future<http.Response> fundAccount (data) async {
    http.Response response =
        await post('pay-now', isAuth: true, body: data);
    return response;
  }
}
