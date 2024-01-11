import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/sendMoneyToBank/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/countries.dart';
import 'package:gomobilez/models/recentTransaction.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/dropdown.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class SendMoneyToBankView extends StatelessWidget {
  const SendMoneyToBankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendMoneyToBankViewmodel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Send Money to Bank ',
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
              DropDown(
                hint: 'Country',
                value: model.selectedCountry,
                loading: model.countriesLoadingState,
                items: model.countryMenuItems
                    .map<DropdownMenuItem<Country>>((Country value) {
                  return DropdownMenuItem<Country>(
                    value: value,
                    child: Text(
                      "${value.name}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) async {
                  if (newValue != null) {
                    await model.setCountryController(newValue);
                  }
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Visibility(
                visible: model.selectedCurrencyRate != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      'Conversion rate:',
                      fontSize: 14.sp,
                    ),
                    BaseText(
                      '${model.selectedCurrencyRate != null ? "\$1 = ${model.selectedCountry!.code} ${model.selectedCurrencyRate!.rate.toString().currencyFormart()}" : 'Getting conversion rate'}',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InputField(
                hint: 'Amount',
                controller: model.amountController,
                keyboardType: TextInputType.number,
                validator: (val) => model.validateInput(val),
                onChanged: (val) {
                  model.notifyListeners();
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Visibility(
                visible: model.selectedCurrencyRate != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      'Amount in dollars:',
                      fontSize: 14.sp,
                    ),
                    BaseText(
                      '${model.selectedCurrencyRate != null && model.amountController.text.isNotEmpty ? '${model.selectedCountry!.code} ${(int.parse(model.amountController.text) * model.selectedCurrencyRate!.rate).toString().currencyFormart()}' : 'Processing conversion rate...'}',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 37.h,
              ),
              LongButton(
                  text: 'Continue',
                  loading: model.sendButtonLoading,
                  click: () {
                    model.onSendMoneyToGomobileUserClicked(context, model);
                  }),
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
      viewModelBuilder: () => SendMoneyToBankViewmodel(),
    );
  }
}
