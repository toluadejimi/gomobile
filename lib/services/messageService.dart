import 'package:dio/dio.dart';
import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class MessageService extends Services {
  Future<http.Response> getNumbers(data) async {
    http.Response response =
        await post('get-list-numbers', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> buyNumber(data) async {
    http.Response response =
        await post('buy-number', isAuth: true, body: data);
    return response;
  }

  Future<http.Response> getRecentMessages() async {
    http.Response response = await get('get-messages', isAuth: true);
    return response;
  }

  Future<http.Response> getConversation(data) async {
    http.Response response = await post('open-message', isAuth: true, body:data);
    return response;
  }

  Future<Response> sendMessage(data) async {
   Response response =
        await dioPost('send-message', data);
    return response;
  }
}
