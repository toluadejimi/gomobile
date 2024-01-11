import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          onBackPress: () => model.navigationService.back(),
          body: Column(children: [
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                model.navigateToSendMoneyToGomobilesUsersPage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    'Send Money to Gomobilez User',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                      onPressed: () {
                        model.navigateToSendMoneyToGomobilesUsersPage();
                      },
                      icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Divider(
              color: dividerGrey,
              height: 3.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                model.navigateToSendMoneyToBankPage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    'Send money to Bank',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                      onPressed: () {
                        model.navigateToSendMoneyToBankPage();
                      },
                      icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),
          ])),
      viewModelBuilder: () => SendAndReceiveMoneyViewmodel(),
    );
  }
}
