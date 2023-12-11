import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/manageDebitAndCredit/viewmodel.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/saved_cards.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/customScaffold.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class ManageDebitAndCreditView extends StatelessWidget {
  const ManageDebitAndCreditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageDebitAndCreditViewmodel>.reactive(
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Debit / Credit Card',
        canPop: true,
        onBackPress: () => model.navigationService.back(),
        body: FutureBuilder(
          future: model.savedCards,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still running, show a loading indicator
              return BaseText('Loading');
            } else if (snapshot.hasError) {
              // If there is an error, display an error message
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // If the Future is complete and successfully fetched data
              // Access the saved cards from the view model
              List<Info> savedCards = snapshot.data!;

              // Use savedCards to build your UI, for example, a ListView.separated

              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 35.h),
                shrinkWrap: true,
                itemCount: savedCards.length,
                itemBuilder: (context, index) {
                  String maskedCustomerId =
                      '**** **** ***${savedCards[index].customerId.substring(savedCards[index].customerId.length - 4)}';
                  return Container(
                    height: 79.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    decoration: ShapeDecoration(
                      color: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgIconInCircle(
                          svgAssetPath:
                              'assets/images/svg/manage_debit_credit.svg',
                          circleSize: 47,
                          circleColor: shadeOfYellow,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              savedCards[index].name,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 3.h),
                            BaseText(
                              maskedCustomerId,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                            SizedBox(height: 1.h),
                            BaseText(
                              'Exp - ${savedCards[index].expMonth}/${savedCards[index].expYear}',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            model.removeSavedCard(index);
                          },
                          child: Icon(
                            Icons.delete_sharp,
                            color: red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
              );
            } else {
              return BaseText('No Card has Been Added');
            }
          },
        ),
      ),
      viewModelBuilder: () => ManageDebitAndCreditViewmodel(),
    );
  }
}
