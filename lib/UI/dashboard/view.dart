import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/contact/view.dart';
import 'package:gomobilez/UI/settings/view.dart';
import 'package:gomobilez/UI/wallet/view.dart';
import 'package:gomobilez/UI/message/view.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/UI/home/view.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/size_config.dart';
import '../../widgets/buttomNavigation.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ViewModelBuilder<DashBoardViewModel>.reactive(
      viewModelBuilder: () => DashBoardViewModel(),
      disposeViewModel: false,
      onViewModelReady: (model) => model.initShowNotification(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: model.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeView(
                  pageController: model.pageController,
                ),
                const WalletView(canPop: false),
                const ContactView(),
                const MessageView(),
                const SettingsView()
              ],
              onPageChanged: (page) {
                model.slideChangePageIndex(page);
              },
            ),
            Visibility(
              visible: model.showNotification,
              child: SafeArea(
                child: FutureBuilder(
                    future: model.user,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            height: 100.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            width: MediaQuery.of(context).size.width,
                            color: black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RoundedIconButton(
                                    padding: 4,
                                    click: () {
                                      model.setShowNotification(false);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 15.sp,
                                    )),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: 5.w),
                                    BaseText(
                                        'Your subscription ends in ${snapshot.data!.myPlan != null ? snapshot.data!.myPlan!.daysRemaining : ''} ${snapshot.data!.myPlan != null ? snapshot.data!.myPlan!.daysRemaining! > 1 ? 'days' : 'day' : ''}.',
                                        fontSize: 16.sp,
                                        color: white),
                                  ],
                                ),
                              ],
                            ));
                      } else {
                        return SizedBox();
                      }
                    }),
              ),
            ),
            CustomButtomNavigation(model: model)
          ],
        ),
      ),
    );
  }
}
