import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/models/messageHistory.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
      disposeViewModel: false,
      onViewModelReady: (model) async => {model.init(context, model)},
      viewModelBuilder: () => MessageViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 28.w,
              right: 28.w,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  BaseText('Messages',
                      fontSize: 22.sp, fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 40.h,
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      await model.getRecentMessages();
                    },
                    child: FutureBuilder(
                      future: model.listOfRecentMessages,
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return ListView.separated(
                                // physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, i) {
                                  MessageHistory message = snapshot.data![i];
                                  return GestureDetector(
                                    onTap: () =>
                                        model.navigateToConversationPage(
                                            message.toNo, message.name),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w, vertical: 16.h),
                                      decoration: const BoxDecoration(
                                        color: transparentWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            './assets/images/svg/web_call_image.svg',
                                            width: 34.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BaseText(message.name != null
                                                  ? message.name!
                                                  : message.toNo),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: BaseText(
                                                          message.text))),
                                            ],
                                          ),
                                          Spacer(),
                                          Visibility(
                                            visible: message.status == 0,
                                            child: Container(
                                                width: 8.w,
                                                height: 8.h,
                                                decoration: BoxDecoration(
                                                    color: red,
                                                    shape: BoxShape.circle)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, __) => SizedBox(
                                  height: 5.h,
                                ),
                              );
                            } else {
                              return Center(
                                child: BaseText('No message hsitory',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          } else {
                            return Center(
                              child: BaseText('No message hsitory',
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            );
                          }
                        } else {
                          return Center(
                              child: BaseText('Loading...',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold));
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 15.w, 100.h),
          child: FloatingActionButton(
            backgroundColor: white,
            onPressed: () {
              model.navigateToDeviceContactPage();
            },
            child:  SvgIconInCircle(
              svgAssetPath: 'assets/images/svg/mi_message.svg',
              circleColor: white,
            ),
          ),
        ),
      ),
    );
  }
}
