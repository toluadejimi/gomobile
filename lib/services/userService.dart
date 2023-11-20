import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class UserService extends Services{

Future<http.Response> getUser() async {
    http.Response response =
        await get('get-user', isAuth: true);
    return response;
  }
  
}