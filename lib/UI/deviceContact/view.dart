import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
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
                        // controller: model.amounController,
                        decoration: const InputDecoration(
                            hintText: 'Type a name, phone number',
                            filled: false,
                            border: InputBorder.none)),
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
                  future: model.getDeviceContact(),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
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
                                        contact.photo != null
                                            ? RoundedIconButton(
                                                click: () {},
                                                icon: Image.memory(
                                                    contact.photo!,
                                                    width: 15.w))
                                            : RoundedIconButton(
                                                padding: 12.w,
                                                click: () {},
                                                icon: BaseText(
                                                  contact.displayName
                                                      .firstLetter(),
                                                  fontSize: 20.sp,
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
                                                child: BaseText(
                                                  contact.displayName,
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
                                                child: Row(children: [
                                                  ...contact.phones.map((cnt) =>
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal: 1),
                                                        child: BaseText(
                                                          cnt.number,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                          fontSize: 16.sp,
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
