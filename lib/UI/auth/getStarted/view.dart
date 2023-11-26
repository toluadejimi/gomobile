import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/auth/getStarted/viewModel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/smallButton.dart';
import 'package:stacked/stacked.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GetStartedViewModel>.reactive(
        viewModelBuilder: () => GetStartedViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: primaryColor,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(28.w, 50.h, 28.w, 0.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'GOMOBILEZ',
                            style: TextStyle(
                                fontSize: 38.sp, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SvgPicture.asset(
                            './assets/images/svg/signup_telephone.svg',
                            semanticsLabel: 'Telephone Image',
                            width: 50.w,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(28.w, 0, 28.w, 0.h),
                      child: Text(
                        'Call and text your family and Friends',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          'assets/images/png/w.png',
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: SmallButton(
                            text: 'Get Started',
                            click: model.goToNextPage,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
