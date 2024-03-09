import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/wallet/bottomSheet.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/recentTransaction.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customIconButton.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:gomobilez/widgets/iconButtonPlusText.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatelessWidget {
  final bool canPop;
  const WalletView({Key? key, this.canPop = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as WalletViewArguments
        : WalletViewArguments();
    return ViewModelBuilder<WalletViewModel>.reactive(
      disposeViewModel: false,
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => WalletViewModel(),
      builder: (context, model, child) => CustomScaffold(
        canPop: args.canPop,
        onBackPress: () => model.navigationService.back(),
        title: 'Fund Wallet',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            BaseText(
              'Main Wallet',
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SvgPicture.asset(
                  './assets/images/svg/solar_wallet-bold.svg',
                  width: 28.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                FutureBuilder(
                    future: model.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return BaseText(
                          "\$${snapshot.data!.wallet.toString()}",
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                        );
                      } else {
                        return BaseText(
                          "\$____",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        );
                      }
                    }),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.57,
                  child: InputField(
                    keyboardType: TextInputType.number,
                    controller: model.amounController,
                    hint: 'Enter Amount to Fund',
                    hintOut: false,
                    validator: (val) => model.validateInput(val),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                IconButtonPlusText(
                  width: 85.w,
                  paddingX: 8.w,
                  paddingY: 10.h,
                  click: () {
                    if (model.amounController.text.isNotEmpty) {
                      model.showButtomModalSheet(
                          context: context,
                          child: WalletBottomSheet(model: model));
                    }
                  },
                  text: 'Continue',
                  suffixIcon: Icon(Icons.arrow_forward),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BaseText(
              'Subscription',
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder(
                future: model.user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.myPlan == null ||
                        (snapshot.data!.myPlan != null &&
                            snapshot.data!.myPlan!.status != 1)) {
                      return GestureDetector(
                        onTap: () => model.navigateToSubscriptionPage(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: white36,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 16.h),
                          child: Row(children: [
                            RoundedIconButton(
                              click: () {},
                              color: primaryColor,
                              padding: 12,
                              icon: SvgPicture.asset(
                                './assets/images/svg/home_page_plan_icon.svg',
                                width: 22.w,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  'Subscription',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 3.h),
                                BaseText(
                                  'Choose a plan to call family and friends',
                                  fontSize: 12.sp,
                                  color: textGrey,
                                )
                              ],
                            )
                          ]),
                        ),
                      );
                    } else {
                      return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgIconInCircle(
                                svgAssetPath: 'assets/images/svg/ci_bulb.svg',
                                circleSize: 55.sp,
                                circleColor: dividerGrey,
                              ),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      BaseText(
                                        'Subscription',
                                        fontSize: 16.sp,
                                        color: grey,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CustomIconButton(
                                        color: primaryColor,
                                        click: () {},
                                        horizontalPadding: 4.w,
                                        verticalPadding: 1.5.h,
                                        radius: 7.sp,
                                        widget: Icon(
                                          Icons.flip_camera_ios_rounded,
                                          size: 14.sp,
                                          color: black,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0.w),
                                        child: SvgPicture.asset(
                                          './assets/images/svg/home_page_plan_icon.svg',
                                          width: 18.w,
                                        ),
                                      ),
                                      FutureBuilder(
                                          future: model.user,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                '${snapshot.data!.myPlan != null ? snapshot.data!.plans!.where((plan) => plan.id == snapshot.data!.myPlan!.planId).toList()[0].title : "No Active Plan"}',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              );
                                            } else {
                                              return Text(
                                                '_____',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              );
                                            }
                                          }),
                                    ],
                                  ),
                                  FutureBuilder(
                                      future:
                                          model.subscriptionProgessWidget(200),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return snapshot.data!;
                                        } else {
                                          return SizedBox();
                                        }
                                      }),
                                ],
                              ),
                            ],
                          ));
                    }
                  } else {
                    return Container();
                  }
                }),
            SizedBox(
              height: 55.h,
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
              height: 200.h,
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
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(height: 2.h),
                                              BaseText(
                                                'Wallet',
                                                fontSize: 12.sp,
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
                                            fontSize: 10.sp,
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
    );
  }
}
