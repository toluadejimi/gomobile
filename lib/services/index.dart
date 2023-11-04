// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart' as model;
import 'dart:io';

import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:gomobilez/helpers/enums/data_table_names.dart';
import 'package:gomobilez/services/localStorageService.dart';

class Services extends LocalStorageService {
 

  AppStates _status = AppStates.unAuthenticated;

  AppStates get status => _status;
  setStatus(AppStates val) {
    _status = val;
  }

  Future<List<Map<dynamic, dynamic>?>?> get(
      DataTableNames tableName, String query) async {
    List<Map<dynamic, dynamic>?>? result;  //connect to endpoint
    return result;
  }

  Future<Map<dynamic, dynamic>?> getById(
      DataTableNames tableName, String id) async {
    Map<dynamic, dynamic>? result; //connect to db
    return result;
  }

  Future<Map<dynamic, dynamic>?> create(
      DataTableNames tableName, Map userData) async {
    Map<dynamic, dynamic>? result; //connect to db
    return result;
  }

  
  Future<int?> delete(
      DataTableNames tableName, String clause, Map userData) async {
    int? result;  //connect to db
    return result;
  }

  Future<String?> uploadAsset(File file) async {
    String? response; //connect to db
      return response;
  }
}
