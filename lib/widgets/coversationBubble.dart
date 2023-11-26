import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/conversation.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ConversationBubble extends StatelessWidget {
  final Conversation conversation;
  final Future<User?> userData;
  final PickedFile? selectedImage;
  const ConversationBubble(
      {super.key,
      required this.conversation,
      required this.userData,
      this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userData,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data!;
            return Row(
              mainAxisAlignment: user.myNumber!.phoneNo != conversation.fromNo
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: user.myNumber!.phoneNo != conversation.fromNo,
                  child: RoundedIconButton(
                    color: white,
                    click: () {},
                    icon: const BaseText(
                      'M',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Visibility(
                  visible: user.myNumber!.phoneNo != conversation.fromNo,
                  child: SizedBox(
                    width: 10.w,
                  ),
                ),
                Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
                    decoration: BoxDecoration(
                        color: user.myNumber!.phoneNo != conversation.fromNo
                            ? white
                            : transparentWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment:
                          user.myNumber!.phoneNo != conversation.fromNo
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                      children: [
                        _buildMessageContent(user, context),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          new DateFormat('yyyy-MM-dd hh:mm a')
                              .format(conversation.createdAt),
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 10.sp),
                        )
                      ],
                    )),
                if (selectedImage != null)
                  SizedBox(
                    height: 1.h,
                    child: Image.file(selectedImage! as File),
                  ),
                Visibility(
                  visible: user.myNumber!.phoneNo == conversation.fromNo,
                  child: SizedBox(
                    width: 10.w,
                  ),
                ),
                Visibility(
                  visible: user.myNumber!.phoneNo == conversation.fromNo,
                  child: RoundedIconButton(
                    color: transparentWhite,
                    click: () {},
                    icon: BaseText(
                      user.firstName.firstLetter(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Text('..............');
          }
        });
  }

  Widget _buildMessageContent(User user, BuildContext context) {
    if (conversation.media != null) {
      return Image.network(conversation.media!);
    } else if (selectedImage != null) {
      return Image.file(selectedImage! as File);
    } else {
      return Text(
        conversation.text,
        softWrap: true,
        textAlign: user.myNumber!.phoneNo != conversation.fromNo
            ? TextAlign.start
            : TextAlign.end,
      );
    }
  }
}
