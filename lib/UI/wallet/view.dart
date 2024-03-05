import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/iconButtonPlusText.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => WalletViewModel(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Fund Wallet',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            const BaseText(
              'Main Wallet',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(
                  './assets/images/svg/solar_wallet-bold.svg',
                  width: 30,
                ),
                const SizedBox(
                  width: 4,
                ),
                const BaseText(
                  "\$0.00",
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: InputField(
                    hint: 'Enter Amount to Fund',
                    hintOut: false,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButtonPlusText(
                  width: 110,
                  paddingX: 10,
                  paddingY: 12,
                  click: () {},
                  text: 'Continue',
                  suffixIcon: Icon(Icons.arrow_forward),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BaseText(
              'Subscription',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: white36,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: Row(children: [
                RoundedIconButton(
                  click: () {},
                  color: primaryColor,
                  padding: 12,
                  icon: SvgPicture.asset(
                    './assets/images/svg/home_page_plan_icon.svg',
                    width: 25,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      'Subscription',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 3),
                    BaseText(
                      'Choose a plan to call family and friends',
                      fontSize: 14,
                      color: textGrey,
                    )
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 120,
            ),
            BaseText(
              'Recent Transaction',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RoundedIconButton(
                                color: green,
                                padding: 10,
                                click: () {},
                                icon: Icon(
                                  Icons.arrow_downward,
                                  color: white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BaseText(
                                    'Wallet Funding',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 2),
                                  BaseText(
                                    'Wallet',
                                    fontSize: 16,
                                    color: textGrey,
                                  ),
                                  Row()
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BaseText(
                                '\$20',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              BaseText(
                                '3mins ago',
                                fontSize: 16,
                                color: textGrey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 15))
          ],
        ),
      ),
    );
  }
}
