import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class SettingsService extends Services {
  Future<http.Response> getPlans() async {
    http.Response response = await get('get-plans', isAuth: true);
    return response;
  }

  Future<http.Response> getLegalTerms() async {
    http.Response response = await get('legal-terms', isAuth: true);
    return response;
  }
}
