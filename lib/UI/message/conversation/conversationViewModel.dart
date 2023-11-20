import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/services/messageService.dart';

class ConversationViewModel extends MessageViewModel {
  TextEditingController messageController = TextEditingController();
  MessageService _messageService = locator<MessageService>();

  bool _showEmojiPad = false;
  bool get showEmojiPad => _showEmojiPad;
  setShowEmojiPad(bool val) {
    _showEmojiPad = val;
    notifyListeners();
  }

  sendMessage(String phoneNumber, {name = ''}) async {
    if (messageController.text.isNotEmpty) {
      try {
        var data = FormData.fromMap({
          "receiver": phoneNumber.standardPhoneNumberFormart(),
          "message": messageController.text,
          "name": name,
        });

        Response response = await _messageService.sendMessage(data);

        if (response.statusCode == 200) {
          await getCoversation(phoneNumber, name: name);
          messageController.clear();
          notifyListeners();
        } else {
          return null;
        }
      } catch (e) {
        errorHandler(e);
        return null;
      }
    }
  }
}
