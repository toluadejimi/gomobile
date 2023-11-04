import 'package:gomobilez/UI/Profile/view.dart';
import 'package:gomobilez/UI/chat/view.dart';
import 'package:gomobilez/UI/dashboard/viewModel.dart';
import 'package:gomobilez/UI/home/index.dart';
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
      // onModelReady: (model)=> model.init(),
      builder: (context, model, child) => Stack(
        children: [
          PageView(
            controller: model.pageController,
            children: const [ProfileView(), HomeView(), ChatView()],
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
