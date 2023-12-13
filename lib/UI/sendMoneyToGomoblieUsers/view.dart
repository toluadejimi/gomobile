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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 7.h,
            ),
            InputField(
              hint: 'Email',
              controller: model.emailTextController,
              onChanged: (val) => model.onSearchChanged(),
            ),
            Row(
              children: [
                BaseText(
                  '${model.recipientName != null ? model.recipientName : 'Input a registered email'}',
                  fontWeight: FontWeight.bold,
                ),
                Visibility(
                  visible: model.recipientName != null,
                  child: Icon(
                    Icons.verified,
                    size: 12.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            InputField(
              hint: 'Amount',
              controller: model.amountController,
            ),
            SizedBox(
              height: 37.h,
            ),
            Visibility(
                visible: model.emailVerified,
                child: LongButton(text: 'Continue', click: () {})),
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
              height: 370.h,
              child: FutureBuilder(
                  future: model.recentTransaction,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data != null && snapshot.data!.length > 0) {
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
                                                transactions[index].status == 4
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
      viewModelBuilder: () => SendMoneyToGomoblieUsersViewmodel(),
    );
  }
}