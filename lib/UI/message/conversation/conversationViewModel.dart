import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/services/messageService.dart';
import 'package:image_picker/image_picker.dart';

class ConversationViewModel extends MessageViewModel {
  TextEditingController messageController = TextEditingController();
  MessageService _messageService = locator<MessageService>();
  FocusNode focusNode = FocusNode();
  initState() {
    focusNode.addListener(() {
      setShowEmojiPad(false);
    });
  }

  bool _showEmojiPad = false;
  bool get showEmojiPad => _showEmojiPad;
  setShowEmojiPad(bool val) {
    _showEmojiPad = val;
    notifyListeners();
  }

  bool _reFreshing = false;
  bool get reFreshing => _reFreshing;
  setRefreshing() {
    _reFreshing = !_reFreshing;
    notifyListeners();
  }

  refresh(String phoneNumber, {name = ''}) async {
    setRefreshing();
    await getCoversation(phoneNumber, name: name);
    setRefreshing();
  }

  File? selectedImage = null;

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  deleteImage() {
    selectedImage = null;
    notifyListeners();
  }

  sendMessage(String phoneNumber, {name = ''}) async {
    if (messageController.text.isNotEmpty) {
      try {
        var data = FormData.fromMap({
          "receiver": phoneNumber.standardPhoneNumberFormart(),
          "message": messageController.text,
          "name": name,
          'file': selectedImage
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
