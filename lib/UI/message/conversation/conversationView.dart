import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/app/app.router.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/conversation.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/UI/message/conversation/conversationViewModel.dart';
import 'package:gomobilez/widgets/coversationBubble.dart';
import 'package:gomobilez/widgets/input.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stacked/stacked.dart';

class ConversationView extends StatelessWidget {
  final String phoneNumber, name;
  final bool newConversation;
  const ConversationView(
      {super.key,
      required this.phoneNumber,
      required this.name,
      this.newConversation = true});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments
            as ConversationViewArguments
        : ConversationViewArguments(
            newConversation: newConversation,
            phoneNumber: phoneNumber,
            name: name);
    return ViewModelBuilder<ConversationViewModel>.reactive(
      onViewModelReady: (model) =>
          model.getCoversation(args.phoneNumber, name: args.name),
      viewModelBuilder: () => ConversationViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
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
                        const SizedBox(width: 20),
                        Text(
                          newConversation ? 'New Conversation' : 'Conversation',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        BaseText(
                          'To',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 6.h),
                          decoration: const BoxDecoration(
                              color: transparentWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: BaseText(
                            args.name,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        RoundedIconButton(
                          padding: 3.w,
                          color: transparentWhite,
                          click: () => !model.reFreshing
                              ? model.refresh(args.phoneNumber, name: args.name)
                              : null,
                          icon: !model.reFreshing
                              ? Icon(Icons.refresh_rounded)
                              : LoadingAnimationWidget.inkDrop(
                                  color: black,
                                  size: 20.sp,
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  FutureBuilder(
                      future: model.listOfConversation,
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return Expanded(
                                child: ListView.separated(
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemBuilder: (ctx, i) {
                                      Conversation conversation =
                                          snapshot.data![i];
                                      return ConversationBubble(
                                          conversation: conversation,
                                          userData: model.user);
                                    },
                                    separatorBuilder: (ctx, i) {
                                      return SizedBox(
                                        height: 10.h,
                                      );
                                    },
                                    itemCount: snapshot.data!.length),
                              );
                            } else {
                              return const Center(
                                  child: BaseText('No conversation'));
                            }
                          } else {
                            return const Center(
                                child: BaseText('No conversation'));
                          }
                        } else {
                          return const Center(child: BaseText('loading....'));
                        }
                      }),
                  SizedBox(
                    height: model.selectedImage != null ? 170.h : 60.h,
                  ),
                  Visibility(
                    visible: model.showEmojiPad,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                  )
                ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    height: 100.h,
                    child: Visibility(
                        visible: model.selectedImage != null,
                        child: model.selectedImage != null
                            ? Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.file(model.selectedImage!),
                                  RoundedIconButton(
                                      color: red,
                                      padding: 3,
                                      click: () {
                                        model.deleteImage();
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: white,
                                        size: 12.sp,
                                      ))
                                ],
                              )
                            : SizedBox()),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.bottomCenter,
                    color: primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: GestureDetector(
                            onTap: () => model.setShowEmojiPad(false),
                            child: InputField(
                              showCursor: true,
                              readOnly: model.showEmojiPad,
                              controller: model.messageController,
                              focusNode: model.focusNode,
                              hint: 'Text message',
                              hintOut: false,
                              prefixIcon: GestureDetector(
                                  onTap: () {
                                    model.pickImage();
                                  },
                                  child: Icon(Icons.photo_album)),
                              suffixIcon: SizedBox(
                                width: 50.w,
                                child: GestureDetector(
                                  onTap: () {
                                    model.showEmojiPad
                                        ? FocusScope.of(context).requestFocus()
                                        : FocusScope.of(context).unfocus();
                                    model.setShowEmojiPad(!model.showEmojiPad);
                                  },
                                  child: Icon(
                                    model.showEmojiPad
                                        ? Icons.keyboard
                                        : Icons.emoji_emotions,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        RoundedIconButton(
                          color: transparentWhite,
                          padding: 8.w,
                          click: () {
                            // model.sendMessage(args.phoneNumber,
                            //     name: args.name);
                            if (model.messageController.text.isNotEmpty) {
                              model.sendMessage(args.phoneNumber,
                                  name: args.name);
                            } else if (model.selectedImage != null) {
                              //=====this next line is for the api code that sends
                              // model.sendImage(args.phoneNumber, name: args.name);
                            }
                          },
                          icon: const Icon(Icons.send, color: black),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: model.showEmojiPad,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: EmojiPicker(
                        onEmojiSelected: (Category? category, Emoji emoji) {
                          // Do something when emoji is tapped (optional)
                        },
                        onBackspacePressed: null,
                        textEditingController: model
                            .messageController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                        config: Config(
                          columns: 8,
                          emojiSizeMax: 25 *
                              (Platform.isIOS
                                  ? 1.30
                                  : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                          bgColor: transparentWhite,
                          indicatorColor: primaryColor,
                          iconColor: black,
                          iconColorSelected: primaryColor,
                          backspaceColor: black,
                          skinToneIndicatorColor: black,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
