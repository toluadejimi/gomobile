import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/contactUs/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/contact_Us.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Contact Us',
        canPop: true,
        onBackPress: () {
          model.navigationService.back();
        },
        body: FutureBuilder<ContactUs?>(
          future: model.contactUs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  BaseText(
                    'Do you have any questions? Contact us to the following email, we will be more than happy to help you',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 68,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            'Start a call with support',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          BaseText(
                            snapshot.data!.data.phoneNo,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      RoundedIconButton(
                        padding: 12,
                        click: () {
                          model.onClickCall();
                        },
                        icon: Icon(
                          Icons.call_outlined,
                          color: white,
                        ),
                        color: black,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            'Send us an Email',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          BaseText(
                            snapshot.data!.data.email,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      RoundedIconButton(
                        padding: 12,
                        click: () {
                          model.onClickMail();
                        },
                        icon: Icon(
                          Icons.mail,
                          color: white,
                        ),
                        color: black,
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
