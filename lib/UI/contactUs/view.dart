import 'package:flutter/material.dart';
import 'package:gomobilez/UI/contactUs/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
      builder: (context, model, child) => CustomScaffold(
        title: 'Contact Us',
        canPop: true,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          BaseText(
            'Do you have any questions? Contact us to the following email, we will be more than happy to help you',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 68,
          ),
          BaseText(
            'Start a call with support',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                '+1(774)-366-3362',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              SvgIconInCircle(
                svgAssetPath: 'assets/images/svg/contactUsCallIcon.svg',
                circleColor: black,
                circleSize: 34,
                svgColor: white,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: dividerGrey,
            height: 3,
          ),
          SizedBox(
            height: 30,
          ),
          BaseText(
            'Send us an Email',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                'support@gomobilez.com',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              SvgIconInCircle(
                svgAssetPath: 'assets/images/svg/contactUsCallIcon.svg',
                circleColor: black,
                circleSize: 34,
                svgColor: white,
              ),
            ],
          ),
        ]),
      ),
      viewModelBuilder: () => ContactUsViewModel(),
    );
  }
}
