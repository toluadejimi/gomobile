import 'package:flutter/material.dart';
import 'package:gomobilez/UI/updateProfile/viewModel.dart';
import 'package:stacked/stacked.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
      viewModelBuilder: () => UpdateProfileViewModel(),
    );
  }
}
