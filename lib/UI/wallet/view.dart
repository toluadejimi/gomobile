import 'package:flutter/material.dart';
import 'package:gomobilez/UI/wallet/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => WalletViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 90.0, 0, 0),
                  child: SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/solar_cup-star-bold.svg',
                    circleSize:
                        142.0, // Specify the size of the circular container
                    circleColor: green,
                    svgColor:
                        white, // Specify the color of the circular container
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: BaseText(
                    'Congratulations',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 58.0),
                  child: BaseText(
                    '+1(456-786-9087) is now yours',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                  child: SmallButton(
                    click: () {},
                    text: 'Home',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                  child: SmallButton(
                    click: () {},
                    text: 'Share',
                    color: black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
