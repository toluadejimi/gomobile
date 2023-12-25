import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/recentTransaction.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class SendMoneyToGomoblieUsersView extends StatelessWidget {
  const SendMoneyToGomoblieUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendMoneyToGomoblieUsersViewmodel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Send Money to Gomobilez Users ',
        canPop: true,
        onBackPress: () => model.navigationService.back(),
        body: Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              InputField(
                hint: 'Email',
                controller: model.emailTextController,
                validator: (val) => model.validateEmailInput(val),
                onChanged: (val) => model.onSearchChanged(),
              ),
              Visibility(
                visible: model.recipientName != null,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.all(Radius.circular(8.sp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        '${model.recipientName != '' ? model.recipientName : 'Input a registered email'}',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: white,
                      ),
                      Visibility(
                        visible: model.recipientName != '',
                        child: Icon(
                          Icons.verified,
                          size: 12.sp,
                          color: white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InputField(
                hint: 'Amount',
                controller: model.amountController,
                validator: (val) => model.validateInput(val),
              ),
              SizedBox(
                height: 37.h,
              ),
              Visibility(
                  visible: model.emailVerified,
                  child: LongButton(
                      text: 'Continue',
                      loading: model.sendButtonLoading,
                      click: () {
                        model.onSendMoneyToGomobileUserClicked(context, model);
                      })),
              SizedBox(
                height: 30.h,
              ),
              BaseText(
                'Recent Transaction',
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 340.h,
                child: FutureBuilder(
                    future: model.recentTransaction,
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null &&
                            snapshot.data!.length > 0) {
                          List<RecentTransaction> transactions = snapshot.data!;
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: transactions.length,
                              itemBuilder: (context, index) => Container(
                                    margin: EdgeInsets.only(top: 10.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18.w, vertical: 18.h),
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            RoundedIconButton(
                                              color:
                                                  transactions[index].status ==
                                                          4
                                                      ? green
                                                      : red,
                                              padding: 10,
                                              click: () {},
                                              icon: Icon(
                                                transactions[index].type == 2
                                                    ? Icons.arrow_upward
                                                    : Icons.arrow_downward,
                                                color: white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                BaseText(
                                                  transactions[index].type == 2
                                                      ? 'Wallet Withdrawal'
                                                      : 'Wallet Funding',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                SizedBox(height: 2.h),
                                                BaseText(
                                                  'Wallet',
                                                  fontSize: 14.sp,
                                                  color: textGrey,
                                                ),
                                                Row()
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            BaseText(
                                              '\$${transactions[index].amount.toString()}',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            BaseText(
                                              '${model.daysBetween(DateTime.parse(transactions[index].createdAt), DateTime.now())} ago',
                                              fontSize: 14.sp,
                                              color: textGrey,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15));
                        } else {
                          return BaseText('No Recent Transactions');
                        }
                      } else {
                        return BaseText('Loading...');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SendMoneyToGomoblieUsersViewmodel(),
    );
  }
}
