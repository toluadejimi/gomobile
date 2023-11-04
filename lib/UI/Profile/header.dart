import 'package:gomobilez/UI/Profile/viewModel.dart';
import 'package:flutter/material.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/size_config.dart';

class Header extends StatelessWidget {
  final ProfileViewModel model;
  const Header({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(width(10), height(5), width(10), height(3)),
      width: MediaQuery.of(context).size.width,
      color: primaryColor,
     );
  }
}
