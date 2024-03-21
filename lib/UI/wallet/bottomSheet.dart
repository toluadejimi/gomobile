import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/enums/payment_options.dart';
import 'package:gomobilez/models/saved_cards.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../helpers/enums/localStorageValues.dart';
import '../../models/user.dart';
import '../../services/localStorageService.dart';
import '../../services/stripe_service.dart';
import '../startUp/appBaseScreen.dart';

class WalletBottomSheet extends StatefulWidget {
  final WalletViewModel model;
  const WalletBottomSheet({super.key, required this.model});

  @override
  State<WalletBottomSheet> createState() => _WalletBottomSheetState();
}

bool _loading = false;

class _WalletBottomSheetState extends State<WalletBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      child: Column(
        children: [
          BaseText(
            'Fund Wallet',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.h),
          BaseText(
            'You\'re about to fund',
            color: textGrey,
            fontSize: 14.sp,
          ),
          SizedBox(height: 20.h),
          BaseText(
            '\$${widget.model.amounController.text}',
            fontSize: 48.sp,
            fontWeight: FontWeight.w900,
          ),
          SizedBox(height: 10.h),
          FutureBuilder(
              future: widget.model.savedCards,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Visibility(
                    visible: snapshot.data!.length > 0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: BaseText('Saved Cards:'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
          FutureBuilder(
              future: widget.model.savedCards,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    child: Visibility(
                      visible: snapshot.data!.length > 0,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Info savedCards = snapshot.data![index];

                          String maskedCustomerId =
                              '**** **** ***${savedCards.customerId.substring(savedCards.customerId.length - 4)}';
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.model
                                    .setSelectedCard(savedCards.customerId);
                              });
                            },
                            child: Container(
                              height: 79.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                              ),
                              decoration: BoxDecoration(
                                  color: widget.model.selectedCardId ==
                                          savedCards.customerId
                                      ? primaryColor
                                      : transaparentGrey,
                                  // border: Border.all(
                                  //     width: 2,
                                  //     color: widget.model.selectedCardId ==
                                  //             savedCards.customerId
                                  //         ? Colors.black
                                  //          : primaryColor
                                  //         ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgIconInCircle(
                                    svgAssetPath:
                                        'assets/images/svg/manage_debit_credit.svg',
                                    circleSize: 47,
                                    circleColor: white,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BaseText(
                                        savedCards.name,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 3.h),
                                      BaseText(
                                        maskedCustomerId,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textGrey,
                                      ),
                                      SizedBox(height: 1.h),
                                      BaseText(
                                        'Exp - ${savedCards.expMonth}/${savedCards.expYear}',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: black,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.model.setVendor(PaymentOptions.pay_pal);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: widget.model.vendor == PaymentOptions.pay_pal
                      ? primaryColor
                      : transaparentGrey,
                  borderRadius: BorderRadius.circular(10.w)),
              child: Row(
                children: [
                  RoundedIconButton(
                    color: transaparentGrey,
                    click: () {},
                    icon: SvgPicture.asset(
                        './assets/images/svg/paypal_grey_icon.svg'),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        'Pay with PayPal',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      BaseText('Fund your wallet using paypal')
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.model.setVendor(PaymentOptions.stripe);
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: widget.model.vendor == PaymentOptions.stripe
                      ? primaryColor
                      : transaparentGrey,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Row(
                  children: [
                    RoundedIconButton(
                      color: transaparentGrey,
                      click: () {},
                      icon: SvgPicture.asset(
                          './assets/images/svg/debit_card_icon.svg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            'Pay with Debit / Credit Card',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          BaseText(
                              'Fund your wallet using Debit or Credit card')
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 30.h,
          ),
          LongButton(
            text: 'Proceed',
            color: primaryColor,
            click: () async {
              setState(() {
                _loading = true;
              });
              if (widget.model.vendor == PaymentOptions.stripe) {
                Navigator.pop(context);
                User? user = await LocalStorageService()
                    .getUserFromStorage(LocalStorageValues.user);
                StripeService().stripeMakePayment((p0) {
                  Navigator.of(StackedService.navigatorKey!.currentContext!)
                      .pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const AppBaseScreen()),
                          (Route<dynamic> route) => false);
                },
                    email: user!.email,
                    amount: widget.model.amounController.text);
              } else {
                widget.model.proceedToFundWallet();
              }
              print(widget.model.vendor);
            },
            loading: widget.model.loading,
          )
        ],
      ),
    );
  }
}
