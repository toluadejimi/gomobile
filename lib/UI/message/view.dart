import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => MessageViewModel(),
      builder: (context, model, child) => const Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Center(
          child: Text('MESSAGE'),
        )),
      ),
    );
  }
}
