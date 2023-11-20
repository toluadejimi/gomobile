import 'package:flutter/material.dart';

class ConversationViewArgument {
  final String phoneNumber, name;
  final bool newConversation;
  const ConversationViewArgument(
      {Key? key, required this.phoneNumber, required this.name,  this.newConversation = true});
}
