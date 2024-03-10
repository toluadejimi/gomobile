import 'package:flutter/material.dart';
import 'package:gomobilez/UI/auth/getStarted/view.dart';
import 'package:gomobilez/UI/auth/signIn/index.dart';
import 'package:gomobilez/UI/dashboard/view.dart';
import 'package:gomobilez/UI/startUp/appBaseViewModel.dart';
import 'package:gomobilez/helpers/enums/app_states.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/app_colors.dart';
import '../../services/call_service.dart';
import '../../services/telnyx_service.dart';

class AppBaseScreen extends StatefulWidget {
  const AppBaseScreen({Key? key}) : super(key: key);

  @override
  State<AppBaseScreen> createState() => _AppBaseScreenState();
}

class _AppBaseScreenState extends State<AppBaseScreen> {
  final _callService = CallService();
  @override
  void initState() {
    super.initState();
    _callService.checkPermissions().then((value) => print("hello"));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TelnyxService>(context, listen: true).observeResponses();
    Provider.of<TelnyxService>(context, listen: true).connect();
    return SafeArea(
      child: Column(
        children: [
          Material(
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Provider.of<TelnyxService>(context, listen: true)
                          .registered
                      ? Colors.green
                      : Colors.orange),
              child: Center(
                child: Text(
                  Provider.of<TelnyxService>(context, listen: true).registered
                      ? "You are welcome, make affordable calls"
                      : "Getting read for Call",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Expanded(
            child: ViewModelBuilder<AppBaseViewModel>.reactive(
              disposeViewModel: false,
              onViewModelReady: (model) => {model.startUp()},
              viewModelBuilder: () => AppBaseViewModel(),
              builder: (context, model, child) =>
                  model.state == AppStates.authenticated
                      ? const DashBoardView()
                      : model.state == AppStates.unAuthenticated
                          ? const LoginView()
                          : model.state == AppStates.noState
                              ? const GetStartedView()
                              : Container(
                                  color: white,
                                ),
            ),
          ),
        ],
      ),
    );
  }
}
