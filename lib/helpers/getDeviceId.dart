import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:gomobilez/services/firebaseService.dart';



Future<String?> getId() async {
 return await FirebaseService().getToken();
}
