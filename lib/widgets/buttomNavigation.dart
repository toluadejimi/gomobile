import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import '../helpers/size_config.dart';
import '../models/pages.dart';

class CustomButtomNavigation extends StatelessWidget {
  final DashBoardViewModel model;

  const CustomButtomNavigation({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Pages> pages = [
      Pages.fromJson({
        'icon': Container(
          width: width(8),
          height: height(8),
          decoration: BoxDecoration(
            color: white,
            shape: BoxShape.circle,
            border: Border.all(
                color: model.pageIndex == 0 ? primaryColor : grey, width: 2),
          ),
          child: const Icon(
            Icons.person,
            color: primaryColor,
            size: 35,
          ),
        ),
        'index': 0
      }),
      Pages.fromJson({
        'icon': Container(
          width: width(12),
          height: height(12),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
            border: Border.all(
                color: model.pageIndex == 1 ? white : primaryColor, width: 2),
          ),
          child: Image.asset(
            'assets/images/logoIcon.png',
            width: width(2),
            height: height(2),
          ),
        ),
        'index': 1
      }),
      Pages.fromJson({
        'icon': Container(
          width: width(8),
          height: height(8),
          decoration: BoxDecoration(
            color: white,
            shape: BoxShape.circle,
            border: Border.all(
                color: model.pageIndex == 2 ? primaryColor : grey, width: 2),
          ),
          child: const Icon(
            Icons.forum_outlined,
            color: primaryColor,
            size: 30,
          ),
        ),
        'index': 2
      })
    ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: transparentGrey,
            height: height(6),
          ),
          SizedBox(
            height: height(12),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                Pages page = pages[index];
                return GestureDetector(
                  child: page.icon,
                  onTap: () => {model.changePage(index)},
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: width(8),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
