
import 'package:gomobilez/services/index.dart';
import 'package:http/http.dart' as http;

class AuthService extends Services {
  
  Future<http.Response> verifyEmail(data) async {
    http.Response response =
        await post('verify-email', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> verifyEmailOTP(data) async {
    http.Response response =
        await post('verify-email-otp', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> register(data) async {
    http.Response response = await post('register', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> resendOTP(data) async {
    Future<http.Response> response =
        post('resend-otp-code', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> forgotPasswordEmailVerifaction(data) async {
    Future<http.Response> response =
        post('forgot-passsord', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> resetPassword(data) async {
    Future<http.Response> response =
        post('reset-password', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> login(data) async {
    Future<http.Response> response =
        post('login', isAuth: false, body: data);
    return response;
  }

  Future<http.Response> deleteAccount() async {
    Future<http.Response> response = get('delete-account', isAuth: true);
    return response;
  }

}
