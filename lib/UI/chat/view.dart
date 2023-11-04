
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gomobilez/UI/chat/viewModel.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatelessWidget {
 const ChatView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ChatViewModel>.reactive(
    disposeViewModel: false,
     builder: (context, model, child) => Container( color: primaryColor,),
     viewModelBuilder: () => ChatViewModel(),
   );
 }
}