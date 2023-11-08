// ignore_for_file: dead_code

import 'package:gomobilez/widgets/alertify.dart';

errorHandler(Object e) {
  switch (e) {
    default:
      {
        Alertify(title: 'Unkown error', message: 'Client Exception')
            .error();
            print(e);
        return null;
      }
  }
}
