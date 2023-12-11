import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Container(
          color: primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...pages.map(
                  (page) => Container(
                    margin: EdgeInsets.only(bottom: 28.h, top: 10.h),
                    child: Stack(alignment: Alignment.topRight, children: [
                      RoundedIconButton(
                        click: () => {model.changePage(page.index)},
                        color: model.pageIndex == page.index
                            ? white
                            : transparentWhite,
                        icon: model.pageIndex == page.index
                            ? SvgPicture.asset(
                                page.iconOn,
                                width: 24.w,
                              )
                            : SvgPicture.asset(
                                page.iconOff,
                                width: 24.w,
                              ),
                      ),
                      FutureBuilder(
                          future: model.user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Visibility(
                                visible: page.index == 3 &&
                                    snapshot.data!.pendingMessages != null,
                                child: RoundedIconButton(
                                  color: red,
                                  padding: 5,
                                  click: () {
                                    model.changePage(page.index);
                                  },
                                  icon: Text(
                                    snapshot.data!.pendingMessages != null
                                        ? snapshot.data!.pendingMessages!
                                            .toString()
                                        : '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: white,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Text('');
                            }
                          })
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
