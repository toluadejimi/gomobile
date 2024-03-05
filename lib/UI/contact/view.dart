import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/contact/emptyContactList.dart';
import 'package:gomobilez/UI/contact/loading.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/dateTime.dart';
import 'package:gomobilez/models/receentCalls.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/callKeyPad.dart';
import 'package:gomobilez/widgets/pageLoading.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class ContactView extends StatelessWidget {
  final bool canPop;
  const ContactView({Key? key, this.canPop = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Visibility(
          visible: model.showFab,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: RoundedIconButton(
              color: black,
              click: () => model.showButtomModalSheet(
                  context: context,
                  child: CallKeyPad(
                    call: model.makeCall,
                    click: () => model.navigationService
                        .navigateToDeviceContactView(
                            title: "Select Contact",
                            click: model.navigateBackFromContactScreen),
                  ),
                  curve: 0),
              icon: Icon(
                Icons.dialpad,
                size: 26.w,
                color: white,
              ),
            ),
          ),
        ),
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: canPop,
                      child: GestureDetector(
                          onTap: () => model.pop(),
                          child: Icon(Icons.arrow_back)),
                    ),
                    Visibility(
                      visible: canPop,
                      child: SizedBox(
                        width: 20.w,
                      ),
                    ),
                    BaseText(
                      'Call Logs',
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                FutureBuilder(
                  future: model.contactHistory,
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error} occurred',
                          style: TextStyle(fontSize: 16.sp),
                        );
                      } else if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          if (snapshot.data!.length > 0) {
                            model.setShowFab(true);
                            List<RecentCalls> data = snapshot.data!;
                            return Expanded(
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (ctx, i) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 15.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundedIconButton(
                                          click: () {},
                                          padding: 8.w,
                                          color: primaryColor,
                                          icon: SvgPicture.asset(
                                            './assets/images/svg/call_log_call_outbound.svg',
                                            width: 20.sp,
                                          )),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 95.w,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              child: Text(
                                                data[i].name != null
                                                    ? data[i].name!
                                                    : data[i].toPhone,
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          SizedBox(
                                            width: 95.w,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              child: Text(
                                                data[i].toPhone,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                          ),
                                          height: 40.h,
                                          width: 1.5.w,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            data[i].createdAt.getTime(),
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            'Outgoing call',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: textGrey),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                          ),
                                          height: 40.h,
                                          width: 1.5.w,
                                        ),
                                      ),
                                      RoundedIconButton(
                                        click: () {
                                          data[i].callUrl != null
                                              ? model.makeCall(data[i].toPhone,
                                                  name: data[i].name)
                                              : null;
                                        },
                                        padding: 0,
                                        icon: SvgPicture.asset(
                                            './assets/images/svg/call_log_call.svg'),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                        child: RoundedIconButton(
                                          padding: 0,
                                          click: () {
                                            model.message(
                                                data[i].toPhone, data[i].name);
                                          },
                                          icon: SvgPicture.asset(
                                              './assets/images/svg/call_log_message.svg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.w))),
                                ),
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.h),
                              ),
                            );
                          } else {
                            return ContactEmptyList(model: model);
                          }
                        } else {
                          return Center(
                            child: Text(
                              'SOMETHING WENT WRONG',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      } else {
                        return Center(
                          child: Text(
                            'SOMETHING WENT WRONG',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: PageLoadingScreen(
                            item: 5, widget: ContactLoadingScreen()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
