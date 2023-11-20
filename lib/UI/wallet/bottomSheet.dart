import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/enums/payment_options.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/longButton.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class WalletBottomSheet extends StatefulWidget {
  final WalletViewModel model;
  const WalletBottomSheet({super.key, required this.model});

  @override
  State<WalletBottomSheet> createState() => _WalletBottomSheetState();
}

PaymentOptions _vendor = PaymentOptions.none;
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
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: () {
              widget.model.setVendor(PaymentOptions.pay_pal);
              setState(() {
                _vendor = PaymentOptions.pay_pal;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: _vendor == PaymentOptions.pay_pal
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
              widget.model.setVendor(PaymentOptions.stripe);
              setState(() {
                _vendor = PaymentOptions.stripe;
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: _vendor == PaymentOptions.stripe
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
                    Column(
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
                        BaseText('Fund your wallet using Debit or Credit card')
                      ],
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
            click: () {
              setState(() {
                _loading = true;
              });
              widget.model.proceedToFundWallet();
            },
            loading: widget.model.loading,
          )
        ],
      ),
    );
  }
}
