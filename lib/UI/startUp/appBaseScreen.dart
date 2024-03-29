
import 'package:gomobilez/UI/auth/getStarted/view.dart';
import 'package:gomobilez/UI/auth/signUp/index.dart';
import 'package:gomobilez/UI/dashboard/view.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/app_colors.dart';

class AppBaseScreen extends StatelessWidget {
  const AppBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppBaseViewModel>.reactive(
      disposeViewModel: false,
      onViewModelReady: (model) => {model.startUp()},
      viewModelBuilder: () => AppBaseViewModel(),
      builder: (context, model, child) => model.state == AppStates.authenticated
          ? const DashBoardView()
          : model.state == AppStates.unAuthenticated
              ? const SignUpView()
              : model.state == AppStates.noState
                  ? const GetStartedView()
                  : Container(
                      color: white,
                    ),
    );
  }
}
