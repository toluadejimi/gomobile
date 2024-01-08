import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomobilez/UI/sendAtopUp/send_credit_topup_view.dart';
import 'package:gomobilez/UI/sendAtopUp/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:stacked/stacked.dart';

class SendMoneyTopUp extends StatefulWidget {
  const SendMoneyTopUp({Key? key}) : super(key: key);

  @override
  State<SendMoneyTopUp> createState() => _SendMoneyTopUpState();
}

class _SendMoneyTopUpState extends State<SendMoneyTopUp>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendAtopUpViewmodel>.reactive(
      builder: (context, model, child) => CustomScaffold(
        title: 'Send money top up ',
        canPop: true,
        onBackPress: () => model.navigationService.back(),
        body: Column(
          children: [
            TabBar(
              unselectedLabelColor: black,
              indicatorColor: white,
              indicator: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              // indicatorSize: TabBarIndicatorSize.tab,
              //labelColor: colors.alwaysWhite,
              controller: tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Send Airtime',
                    style: TextStyle(
                        color: black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Tab(
                  child: Text(
                    'Send Data',
                    style: TextStyle(
                        color: black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              height: 700.h,
              width: double.infinity,
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        InputField(
                          hint: 'Country',
                          controller: model.countryController,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        SizedBox(height: 8.h),
                        InputField(
                          hint: 'Service provider',
                          controller: model.serviceProviderController,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        SizedBox(height: 8.h),
                        InputField(
                          hint: 'Product options',
                          controller: model.serviceProductController,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InputField(
                                hint: 'PhoneNumber',
                                controller: model.phoneNumberController,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h),
                              child: SvgPicture.asset(
                                'assets/images/svg/bxs_contact.svg',
                                height: 55.h,
                                width: 60.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        InputField(
                          hint: 'Amount (USD)',
                          controller: model.amountController,
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BaseText('MIn - 5',
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                            BaseText('Max - 50,000',
                                fontSize: 14.sp, fontWeight: FontWeight.w500)
                          ],
                        ),
                        SizedBox(height: 72.h),
                        LongButton(
                            text: 'Continue',
                            click: () {
                              model.buyCredit();
                            })
                      ],
                    ),
                  ),
                  SendCreditTopUp(),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SendAtopUpViewmodel(),
    );
  }
}
