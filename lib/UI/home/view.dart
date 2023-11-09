import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/home/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/greetings.dart';
import 'package:gomobilez/helpers/size_config.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/home_model.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customIconButton.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/home_widget.dart';
import 'package:gomobilez/widgets/iconButtonPlusText.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/responsive_layout.dart';

class HomeView extends StatelessWidget {
  final PageController pageController;
  const HomeView({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) => ResponsiveLayout(
        tab: const CustomScaffold(
          body: SafeArea(
              child: Center(
            child: Text('HOME'),
          )),
        ),
        mobile: CustomScaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white, // Change the color as needed
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  getGreeting(),
                                  fontSize: 16,
                                  color: grey,
                                ),
                                const SizedBox(height: 2),
                                FutureBuilder(
                                    future: model.getUser(),
                                    builder: (ctx, snapshot) {
                                      return snapshot.hasData
                                          ? Text(
                                              snapshot.data!.firstName
                                                  .nameCase(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold))
                                          : const BaseText(
                                              '...',
                                              fontSize: 18,
                                              color: black,
                                            );
                                    }),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const BaseText(
                                      'Subscription',
                                      fontSize: 16,
                                      color: grey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CustomIconButton(
                                        color: primaryColor,
                                        click: () {},
                                        horizontalPadding: 4,
                                        verticalPadding: 1.5,
                                        radius: 7,
                                        widget: const Icon(
                                          Icons.flip_camera_ios_rounded,
                                          size: 12,
                                          color: black,
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: SvgPicture.asset(
                                        './assets/images/svg/home_page_plan_icon.svg',
                                        width: 16,
                                      ),
                                    ),
                                    const Text('No Active Plan',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: black,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SmallButton(
                            horizontalPadding: 8,
                            verticalPadding: 4,
                            text: 'Get Subscription',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            click: () {},
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const BaseText(
                          'Main Wallet',
                          fontSize: 16,
                          color: grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  fontSize: 35,
                                ),
                              ],
                            ),
                            IconButtonPlusText(
                              curve: 18,
                              paddingY: 12,
                              color: primaryColor,
                              click: () => model.changePage(1),
                              // pageController.animateTo(2,
                              //     duration: const Duration(milliseconds: 300),
                              //     curve: Curves.ease),
                              prefixIcon: SvgPicture.asset(
                                './assets/images/svg/home_page_fund_wallet_icon.svg',
                                width: 20,
                              ),
                              width: 140,
                              text: 'Fund Wallet',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: BaseText(
                    'What would you like to do today ?',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing:
                          15.0, // spacing between rows (vertically)
                      crossAxisSpacing:
                          10.0, // spacing between columns (horizontally)
                    ),
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // padding around the grid
                    itemCount: homeModel.length, // total number of items
                    itemBuilder: (context, index) {
                      final home = homeModel[index];
                      return HomeWidget(
                        asset: home['picture'].toString(),
                        title: home['title'].toString(),
                        description: home['description'].toString(),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: ShapeDecoration(
                    color: white36,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(children: [
                    RoundedIconButton(
                      padding: 18,
                      color: primaryColor,
                      click: () {},
                      icon: SvgPicture.asset('assets/images/svg/number.svg'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            'Reserve Phone Number',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          BaseText(
                            'Rent a phone number to\ncall and text family and friends',
                            fontSize: 16,
                            color: textGrey,
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 8),
                  child: BaseText(
                    'Subscription',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                            onTap: () => model.navigateToWeb(),
                            child: Container(
                              width: 311,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: ShapeDecoration(
                                color: veryTransparentWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(children: [
                                RoundedIconButton(
                                  padding: 10,
                                  color: primaryColor,
                                  click: () {},
                                  icon: SvgPicture.asset(
                                      'assets/images/svg/ci_bulb.svg'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BaseText(
                                            'Basic Plan',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: '\$25/',
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  style: TextStyle(
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                  text: 'Month',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                        'Unlimited Calls to your family and friends\nto one country (USA)',
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: textGrey,
                                        )),
                                  ],
                                )
                              ]),
                            ),
                          ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 8,
                        );
                      }),
                ),
                const SizedBox(
                  height: 90,
                )
              ],
            ),
          )),
        ),
        desktop: const Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
              child: Center(
            child: Text('HOME'),
          )),
        ),
      ),
    );
  }
}
