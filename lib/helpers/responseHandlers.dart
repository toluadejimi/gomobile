// ignore_for_file: dead_code

import 'dart:convert';

import 'package:gomobilez/widgets/alertify.dart';
import 'package:http/http.dart' as http;

String? responseHandler(http.Response response) {
  switch (response.statusCode) {
    case 200:
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        Alertify(
          title: 'Success',
                message:
                    data.containsKey("message") ? data['message'] : 'Success')
            .success();
        return response.body;
      }
      break;
    case 201:
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        Alertify(
          title: 'Success',
                message:
                    data.containsKey('message') ? data['message'] : 'Success')
            .success();
        return response.body;
      }
      break;
    case 400:
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        Alertify(
          title: 'Bad Request',
                message:
                    data.containsKey('message') ? data['message'] : 'Success')
            .error();
        return null;
      }
      break;
    case 401:
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        Alertify(
          title: 'Unauthorized',
                message:
                    data.containsKey('message') ? data['message'] : 'Success')
            .error();
        return null;
      }
      break;
    case 404:
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        Alertify(
          title: 'Not Found',
                message: data.containsKey('message')
                    ? data['message']
                    : 'The service you are trying to access is not available')
            .warning();
        return null;
      }
      break;
    case 500:
      {
        Alertify(
                title: 'Server Error',
                message: 'Service teporarily down. Please try again shortly.')
            .error();
        return null;
      }
      break;
    default:
      {
        Alertify(
          title: 'Unkown error',
          message: 'Something went wrong').error();
        return null;
      }
  }
}
