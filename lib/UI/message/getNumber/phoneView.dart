import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/contact/loading.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/numbers.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class NumberView extends StatelessWidget {
  final Future<Number?> Function() future;
  final Future<dynamic> Function(String, BuildContext) buyNumber;
  final ScrollController scrollController;
  const NumberView(
      {super.key,
      required this.future,
      required this.scrollController,
      required this.buyNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
      child: FutureBuilder<Number?>(
        future: future(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.separated(
                controller: scrollController,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.phoneNumbers.length,
                itemBuilder: (ctx, i) {
                  var number = snapshot.data!.phoneNumbers[i];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: GestureDetector(
                      onTap: () {
                        buyNumber(number, context);
                      },
                      child: Row(
                        children: [
                          // BaseText(
                          // EmojiConverter.fromAlpha2CountryCode(number.toString()),
                          //   fontSize: 30,
                          // ),
                          SvgPicture.asset(
                            './assets/images/svg/phone_number_list_icon.svg',
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          BaseText(
                            number,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          BaseText(
                            "\$${snapshot.data!.amount}/Mo",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  color: transaparentGrey,
                  height: 0.5.h,
                ),
              );
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedIconButton(
                        color: primaryColor,
                        click: () {},
                        icon: Icon(
                          Icons.phonelink_lock_outlined,
                          size: 30.sp,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      BaseText(
                        'No available phone number in the\nregion you selected',
                        textAlign: TextAlign.center,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ]),
              );
            }
          } else {
            return ContactLoadingScreen();
          }
        }),
      ),
    );
  }
}
