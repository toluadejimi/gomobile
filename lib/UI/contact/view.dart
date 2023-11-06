
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:stacked/stacked.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: FutureBuilder(future: model.getContactHistory(), builder: (builder))
        ),
      ),
    );
  }
}
