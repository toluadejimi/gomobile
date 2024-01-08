// ignore_for_file: dead_code

import 'dart:convert';

import 'package:gomobilez/widgets/alertify.dart';

errorHandler(e) {
  var error = jsonDecode(e.toString());
  switch (error['message'] ) {
    case null:
      {
        Alertify(
                title: 'Network error',
                message: error['Check your network and try again'])
            .error();
      }
    default:
      {
        Alertify(title: 'Error', message: error['message']).error();
        print(e);
        return null;
      }
  }
}
