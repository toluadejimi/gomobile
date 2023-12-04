import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/manageDebitAndCredit/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class ManageDebitAndCreditView extends StatelessWidget {
  const ManageDebitAndCreditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageDebitAndCreditViewmodel>.reactive(
      builder: (context, model, child) => CustomScaffold(
        title: 'Debit / Credit Card',
        canPop: true,
        body: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 60.h),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 79.h,
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 17, 23, 15),
                    child: Row(children: [
                      SvgIconInCircle(
                        svgAssetPath:
                            'assets/images/svg/manage_debit_credit.svg',
                        circleSize: 47,
                        circleColor: shadeOfYellow,
                      ),
                      SizedBox(width: 10.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            'Jimmy',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 3.h,),
                          BaseText(
                            '**** **** *** 4142',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: textGrey,
                          ),
                          SizedBox(height: 3.h,),
                          BaseText(
                            'Exp - 02/2024',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: textGrey,
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_sharp,
                            color: red,
                          )),
                    ]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.h,
                );
              },
            )
          ],
        ),
      ),
      viewModelBuilder: () => ManageDebitAndCreditViewmodel(),
    );
  }
}
