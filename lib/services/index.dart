import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/constants.dart';
import 'package:gomobilez/helpers/enums/localStorageValues.dart';
import 'package:gomobilez/services/localStorageService.dart';
import 'package:gomobilez/services/tokenService.dart';
import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

class Services extends LocalStorageService {
  final LocalStorageService _storageService = locator<LocalStorageService>();
  // final MyNavigationService _navigationService = locator<MyNavigationService>();
  final TokenService _tokenService = locator<TokenService>();

  Future<http.Response> get(
    String url, {
    Map<String, String> headers = const {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    },
    bool isAuth = false,
  }) async {
    final String? token = await _tokenService.getToken();
    url = APP_BASE_URL + url;
    Uri uri = Uri.parse(url);
    final http.Response res = await http.get(uri, headers: <String, String>{
      if (isAuth) HttpHeaders.authorizationHeader: 'Bearer $token',
      ...headers
    });
    if (isAuth) {
      if (res.statusCode == 401) {
        clearUserData();
      }
    }
    return res;
  }

  Future<http.Response> post(
    String url, {
    Map<String, String> headers = const {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    },
    dynamic body,
    bool isAuth = false,
    bool encodeBody = true,
  }) async {
    final String? token = await _tokenService.getToken();
    url = APP_BASE_URL + url;
    Uri uri = Uri.parse(url);

    final jsonBody = encodeBody ? jsonEncode(body) : body;
    final http.Response res = await http.post(
      uri,
      headers: <String, String>{
        if (isAuth) HttpHeaders.authorizationHeader: 'Bearer $token',
        ...headers
      },
      body: jsonBody,
    );
    if (isAuth) {
      if (res.statusCode == 401) {
        clearUserData();
      }
    }
    return res;
  }

  Future<http.Response> formDataPost(
    String url, {
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
      // 'Accept': 'application/json'
    },
    dynamic body,
    bool isAuth = false,
    bool encodeBody = true,
  }) async {
    final String? token = await _tokenService.getToken();
    url = APP_BASE_URL + url;
    Uri uri = Uri.parse(url);

    final jsonBody = encodeBody ? jsonEncode(body) : body;
    final http.Response res = await http.post(
      uri,
      headers: <String, String>{
        if (isAuth) HttpHeaders.authorizationHeader: 'Bearer $token',
        ...headers
      },
      body: jsonBody,
    );
    if (isAuth) {
      if (res.statusCode == 401) {
        clearUserData();
      }
    }
    return res;
  }

  Future<Response> dioPost(
    String url,
    FormData data, {
    Map<String, String> headers = const {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    },
    bool isAuth = true,
  }) async {
    final String? token = await _tokenService.getToken();
    url = APP_BASE_URL + url;
    var response = await Dio().post(
      url,
      data: data,
      options: Options(
        method: 'POST',
        headers: {"Authorization": "Bearer $token", ...headers},
        responseType: ResponseType.json,
      ),
      onSendProgress: (int sent, int total) {
        print("Sent - $sent , Total : $total");
      },
    );
    print(response);

    if (response.statusCode == 401) {
      clearUserData();
    }

    return response;
  }

  Future<http.Response> put(
    String url, {
    Map<String, String> headers = const {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    },
    dynamic body,
    bool isAuth = false,
    bool encodeBody = true,
  }) async {
    final String? token = await _tokenService.getToken();
    url = APP_BASE_URL + url;
    Uri uri = Uri.parse(url);

    final jsonBody = encodeBody ? jsonEncode(body) : body;
    final http.Response res = await http.put(
      uri,
      headers: <String, String>{
        if (isAuth) HttpHeaders.authorizationHeader: 'Bearer $token',
        ...headers
      },
      body: jsonBody,
    );
    if (res.statusCode == 401) {
      clearUserData();
    }
    return res;
  }

  Future<http.Response> delete(
    String url, {
    Map<String, String> headers = const {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    },
    bool isAuth = false,
    bool encodeBody = true,
  }) async {
    final String? token = await _tokenService.getToken();
    url = APP_BASE_URL + url;
    Uri uri = Uri.parse(url);

    final http.Response res = await http.delete(
      uri,
      headers: <String, String>{
        if (isAuth) HttpHeaders.authorizationHeader: 'Bearer $token',
        ...headers
      },
    );
    if (isAuth) {
      if (res.statusCode == 401) {
        clearUserData();
      }
    }
    return res;
  }

  Future<http.StreamedResponse?> sse(
    http.Client client,
    String url, {
    Map<String, String> headers = const {
      "Accept": "text/event-stream",
      "Cache-Control": "no-cache",
    },
    bool isAuth = false,
  }) async {
    http.Client _client = client;

    final String? token = await _tokenService.getToken();
    try {
      url = APP_BASE_URL + url;
      var request = http.Request("GET", Uri.parse(url));
      request.headers["Cache-Control"] = "no-cache";
      request.headers["Accept"] = "text/event-stream";
      if (isAuth) request.headers["authorization"] = 'Bearer $token';

      Future<http.StreamedResponse> response = _client.send(request);
      return response;
    } catch (e) {
      _client.close();
      return null;
    }
  }

  clearUserData() {
    _storageService.removeFromStorage(LocalStorageValues.token);
    Alertify(
      title: "Token Expired",
      message: "You'll be logged out now",
    ).error();

    NavigationService().pushNamedAndRemoveUntil(Routes.appBaseScreen);
  }

  Future<bool> download(String fileurl, savePath) async {
    await Dio().download(fileurl, savePath,
        onReceiveProgress: (received, total) {
      // if (total != -1) {
      //   // print((received / total * 100).toStringAsFixed(0) + "%");
      //   //you can build progressbar feature too
      // }
    });

    print("File is saved to download folder.");
    return true;
  }
}
