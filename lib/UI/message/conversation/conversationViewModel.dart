import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/app/app.locator.dart';
import 'package:gomobilez/helpers/errorHandler.dart';
import 'package:gomobilez/helpers/string.dart';
import 'package:gomobilez/models/conversation.dart';
import 'package:gomobilez/services/messageService.dart';
import 'package:http/http.dart' as http;
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
      print(File(pickedFile.path));
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
          // 'file': selectedImage,
          "file": selectedImage != null
              ? await MultipartFile.fromFile(selectedImage!.path,
                  filename: await selectedImage!.path.split('/').last)
              : null,
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

  Future<List<Conversation>?>? _listOfConversation = null;
  Future<List<Conversation>?>? get listOfConversation => _listOfConversation;
  setListOfConversation(Future<List<Conversation>?> data) {
    _listOfConversation = data;
    notifyListeners();
  }

  getCoversation(String phoneNumber, {name = ''}) async {
    try {
      var data = {
        "phone_no": phoneNumber.standardPhoneNumberFormart(),
        "name": name
      };
      http.Response response = await _messageService.getConversation(data);
      var raw = jsonDecode(response.body);

      print(raw);

      if (raw['status'] == true) {
        List<Conversation> conversation = [];
        if (raw['data'].length > 0) {
          for (var i = 0; i < raw['data'].length; i++) {
            conversation.add(conversationFromJson(jsonEncode(raw['data'][i])));
          }
        }
        setListOfConversation(Future.value(conversation.reversed.toList()));
      } else {
        return null;
      }
    } catch (e) {
      errorHandler(e);
      return null;
    }
  }
}
