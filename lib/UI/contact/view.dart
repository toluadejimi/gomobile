import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/contact/emptyContactList.dart';
import 'package:gomobilez/UI/contact/loading.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/receentCalls.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/callKeyPad.dart';
import 'package:gomobilez/widgets/pageLoading.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Visibility(
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
                BaseText(
                  'Call Logs',
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),
                FutureBuilder(
                  future: model.getContactHistory(),
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
                            List<RecentCalls> data = snapshot.data!;
                            return Expanded(
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (ctx, i) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 10.h),
                                  child: Text(
                                    data[i].name != null
                                        ? data[i].name!
                                        : 'name',
                                    style: TextStyle(fontSize: 16.sp),
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
