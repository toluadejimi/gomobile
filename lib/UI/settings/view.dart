
import 'package:gomobilez/UI/settings/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => const Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Center(child: Text('SETTINGS'),)
        ),
      ),
    );
  }
}
