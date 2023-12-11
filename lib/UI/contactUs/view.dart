import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/contactUs/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/contact_Us.dart';
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
        body: FutureBuilder<ContactUs?>(
          future: model.getContactUs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
          height: 40,
        ),
        BaseText(
          'Do you have any questions? Contact us to the following email, we will be more than happy to help you',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 68,
        ),
        BaseText(
          'Start a call with support',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        snapshot.data!.data.phoneNo,
                        fontSize: 14.sp,
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
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    snapshot.data!.data.email,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SvgIconInCircle(
                    svgAssetPath: 'assets/images/svg/contactUsCallIcon.svg',
                    circleColor: black,
                    circleSize: 34,
                    svgColor: white,
                  ),
                ],
              )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              
              return CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
      viewModelBuilder: () => ContactUsViewModel(),
    );
  }
}
