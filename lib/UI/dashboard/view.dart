import 'package:gomobilez/UI/contact/view.dart';
import 'package:gomobilez/UI/settings/view.dart';
import 'package:gomobilez/UI/wallet/view.dart';
import 'package:gomobilez/UI/message/view.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/UI/home/view.dart';
import 'package:flutter/material.dart';
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
      // onModelReady: (model)=> model.init(),
      builder: (context, model, child) => Stack(
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
          CustomButtomNavigation(model: model)
        ],
      ),
    );
  }
}
