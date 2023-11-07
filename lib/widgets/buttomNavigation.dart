import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import '../models/pages.dart';

class CustomButtomNavigation extends StatelessWidget {
  final DashBoardViewModel model;

  const CustomButtomNavigation({required this.model, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Pages> pages = [
      Pages.fromJson({
        'iconOn': './assets/images/svg/icon_home_on.svg',
        'iconOff': './assets/images/svg/icon_home_off.svg',
        'index': 0
      }),
      Pages.fromJson({
        'iconOn': './assets/images/svg/icon_wallet_off.svg',
        'iconOff': './assets/images/svg/icon_wallet_off.svg',
        'index': 1
      }),
      Pages.fromJson({
        'iconOn': './assets/images/svg/icon_contact_on.svg',
        'iconOff': './assets/images/svg/icon_contact_off.svg',
        'index': 2
      }),
      Pages.fromJson({
        'iconOn': './assets/images/svg/icon_message_off.svg',
        'iconOff': './assets/images/svg/icon_message_off.svg',
        'index': 3
      }),
      Pages.fromJson({
        'iconOn': './assets/images/svg/icon_settings_on.svg',
        'iconOff': './assets/images/svg/icon_settings_off.svg',
        'index': 4
      })
    ];
    return Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...pages.map((page) => Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: RoundedIconButton(
                      click: () => {model.changePage(page.index)},
                      color: model.pageIndex == page.index
                          ? white
                          : Color.fromARGB(255, 218, 217, 217),
                      icon: model.pageIndex == page.index
                          ? SvgPicture.asset(
                              page.iconOn,
                              width: 26,
                            )
                          : SvgPicture.asset(
                              page.iconOff,
                              width: 26,
                            ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
