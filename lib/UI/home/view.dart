import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/home/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/size_config.dart';
import 'package:gomobilez/models/home_model.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/button.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:gomobilez/widgets/home_widget.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

import '../../helpers/responsive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
                          children: [
                            const BaseText(
                              'Good Morning',
                              fontSize: 16,
                              color: grey,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const BaseText(
                                  'Subscription',
                                  fontSize: 16,
                                  color: grey,
                                ),
                                SizedBox(
                                  width: width(2),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color:
                                          primaryColor, // Set the background color to yellow
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the radius as needed
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Icon(
                                        Icons.flip_camera_ios_rounded,
                                        size: 16,
                                        color: black,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const BaseText(
                              'Kings',
                              fontSize: 16,
                              color: black,
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.newspaper_outlined,
                                size: 16,
                                color: black,
                              ),
                            ),
                            SizedBox(
                              width: width(2),
                            ),
                            const BaseText(
                              'No Active Plan',
                              fontSize: 16,
                              color: black,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SmallButton(
                            horizontalPadding: 4,
                            verticalPadding: 2,
                            text: 'Get subscription',
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
                          children: [
                            SvgPicture.asset(
                              'assets/images/svg/solar_wallet-bold.svg',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const BaseText(
                              "\$0.00",
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                            const Spacer(),
                            const ButtonAndIcon(
                              height: 45,
                              width: 120,
                              icon: (Icons.monetization_on_outlined),
                              color: primaryColor,
                              text: 'Fund Wallet',
                              fontWeight: FontWeight.bold,
                              textColor: black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: BaseText(
                    'What would you like to do today ?',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: SizedBox(
                    height: 400,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing:
                            8.0, // spacing between rows (vertically)
                        crossAxisSpacing:
                            8.0, // spacing between columns (horizontally)
                      ),
                      //shrinkWrap: true,
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
                ),
                Container(
                  height: 68,
                  decoration: ShapeDecoration(
                    color: white.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.0),
                    child: Row(children: [
                      SvgIconInCircle(
                        svgAssetPath: 'assets/images/svg/number.svg',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: BaseText(
                                'Reserve Phone Number',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            BaseText(
                              'Rent a phone number to \ncall and text family and friends',
                              fontSize: 16,
                              color: grey,
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 17, 0, 3),
                  child: BaseText(
                    'Subscription',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 76,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 68,
                        decoration: ShapeDecoration(
                          color: veryTransparentWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.0),
                          child: Row(children: [
                            SvgIconInCircle(
                              svgAssetPath: 'assets/images/svg/ci_bulb.svg',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BaseText(
                                            'Basic Plan',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          BaseText(
                                            '\$25/month',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  BaseText(
                                    'Rent a phone number to \ncall and text family and friends',
                                    fontSize: 16,
                                    color: grey,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
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
