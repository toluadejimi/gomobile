import 'package:flutter/material.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/models/tabModel.dart';

class ProfileViewModel extends DashBoardViewModel {
  final List<TabModel> tabChildren = [
    TabModel.fromJson({"screen": Container(), 'name': 'Plugs'}),
    // TabModel.fromJson({"screen": LikedView(), 'name': 'Favourite'}),
    // TabModel.fromJson({"screen": LikedView(), 'name': 'Ads'})
  ];
}
