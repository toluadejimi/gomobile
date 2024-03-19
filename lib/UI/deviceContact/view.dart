import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/deviceContact/viewModel.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:stacked/stacked.dart';

class DeviceContactView extends StatelessWidget {
  final String title;
  final void Function(Contact) click;
  const DeviceContactView({Key? key, required this.title, required this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments
            as DeviceContactViewArguments
        : DeviceContactViewArguments(title: title, click: click);
    return ViewModelBuilder<DeviceContactViewModel>.reactive(
      viewModelBuilder: () => DeviceContactViewModel(),
      onViewModelReady: (model) => model.getDeviceContact(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.h, 0, 20.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => model.navigationService.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      args.title,
                      style: TextStyle(
                          fontSize: 23.sp, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  BaseText(
                    'To',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: model.searchController,
                      decoration: const InputDecoration(
                          hintText: 'Type a name, phone number',
                          filled: false,
                          border: InputBorder.none),
                      onChanged: (val) {
                        model.onSearchChanged(val);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: BaseText(
                  'Contact List',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              FutureBuilder(
                  future: model.deviceContact,
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          if (snapshot.data!.length == 0) {
                            if (RegExp(r'^[a-z]+$')
                                .hasMatch(model.searchController.text)) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 50.h),
                                child: BaseText(
                                  "You don't have \"${model.searchController.text}\" saved.",
                                  fontSize: 16.sp,
                                ),
                              );
                            } else {
                              return Column(children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                        color: red,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.h),
                                            topRight: Radius.circular(10.h))),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.warning_amber_rounded,
                                          color: white,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        const BaseText(
                                          "You don't have this number saved",
                                          color: white,
                                          fontSize: 16,
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.h),
                                        bottomRight: Radius.circular(10.h)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: BaseText(
                                        model.searchController.text,
                                        fontSize: 16.sp,
                                      )),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      RoundedIconButton(
                                          color: green,
                                          click: () {
                                            model.callUnkownNumber(
                                                model.searchController.text
                                                    .trim(),
                                                args.click);
                                          },
                                          padding: 10,
                                          icon: Icon(
                                            Icons.call,
                                            size: 20.w,
                                          )),
                                    ],
                                  ),
                                )
                              ]);
                            }
                          } else {
                            snapshot.data!.sort((a, b) =>
                                a.displayName.compareTo(b.displayName));

                            return Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, i) {
                                    Contact contact = snapshot.data![i];
                                    return GestureDetector(
                                      onTap: () => args.click(contact),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          RoundedIconButton(
                                            padding: 12.w,
                                            click: () {},
                                            icon: BaseText(
                                              (isNotEmpty(contact.displayName)
                                                      ? contact.displayName
                                                      : "N")
                                                  .firstLetter(),
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.58,
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  child: BaseText(
                                                    contact.displayName ?? "",
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.58,
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  child: Row(children: [
                                                    ...(contact.phones ?? [])
                                                        .map((cnt) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          5,
                                                                      horizontal:
                                                                          1),
                                                              child: BaseText(
                                                                cnt.number,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ))
                                                  ]),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          BaseText(
                                            'Mobile',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, i) {
                                    return SizedBox(
                                      height: 8.h,
                                    );
                                  },
                                  itemCount: snapshot.data!.length),
                            );
                          }
                        } else {
                          return const Center(child: BaseText('No contact'));
                        }
                      } else {
                        return const Center(child: BaseText('No contact'));
                      }
                    } else {
                      return const Center(child: BaseText('loading....'));
                    }
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
