import 'package:flutter/material.dart';
import 'package:gomobilez/UI/updateProfile/viewModel.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:stacked/stacked.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateProfileViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
          title: 'My Profile Settings',
          canPop: true,
          body: Column(
            children: [
              Form(
                key: model.updateProfileViewFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    InputField(
                      hint: 'First Name',
                      controller: model.firstNameController,
                      validator: (value) => model.validateInput(value),
                    ),
                    InputField(
                      hint: 'Last Name',
                      controller: model.lastNameController,
                      validator: (value) => model.validateInput(value),
                    ),
                    InputField(
                      hint: 'Email',
                      controller: model.emailController,
                      validator: (value) => model.validateInput(value),
                    ),
                    InputField(
                      hint: 'Gender',
                      controller: model.genderController,
                      validator: (value) => model.validateInput(value),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              LongButton(text: 'Update', click: () {}),
              const SizedBox(
                height: 40,
              ),
            ],
          )),
      viewModelBuilder: () => UpdateProfileViewModel(),
    );
  }
}
