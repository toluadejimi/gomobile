import 'package:gomobilez/UI/Profile/body.dart';
import 'package:gomobilez/UI/Profile/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [Header(model: model), Body(model: model)],
          ),
        ),
      ),
    );
  }
}
