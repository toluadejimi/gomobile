import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import '../UI/home/viewModel.dart';

class HomePageHeader extends StatelessWidget {
  final HomeViewModel model;
  const HomePageHeader({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
       );
  }
}
