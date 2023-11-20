import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/conversation.dart';
import 'package:gomobilez/models/user.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class ConversationBubble extends StatelessWidget {
  final Conversation conversation;
  final Future<User?> userData;
  const ConversationBubble(
      {super.key, required this.conversation, required this.userData});

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
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
                  decoration: BoxDecoration(
                      color: user.myNumber!.phoneNo != conversation.fromNo
                          ? white
                          : transparentWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    conversation.text,
                    softWrap: true,
                    textAlign: user.myNumber!.phoneNo != conversation.fromNo
                        ? TextAlign.start
                        : TextAlign.end,
                  ),
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
}
