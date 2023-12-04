import 'package:flutter/material.dart';
import 'package:gomobilez/UI/sendAndReceiveMoney/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:stacked/stacked.dart';

class SendAndReceiveMoneyView extends StatelessWidget {
  const SendAndReceiveMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendAndReceiveMoneyViewmodel>.reactive(
      builder: (context, model, child) => CustomScaffold(
          title: 'Send And Receive Money',
          canPop: true,
          body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  'Send Money to Gomobilez User',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                    onPressed: () {
                      model.navigateToSendMoneyToGomobilesUsersPage();
                    },
                    icon: Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: dividerGrey,
              height: 3,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  'Send money to Bank',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
              ],
            ),
          ])),
      viewModelBuilder: () => SendAndReceiveMoneyViewmodel(),
    );
  }
}
