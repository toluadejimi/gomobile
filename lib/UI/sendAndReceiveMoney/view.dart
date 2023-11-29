import 'package:flutter/material.dart';
import 'package:gomobilez/UI/sendAndReceiveMoney/viewModel.dart';
import 'package:stacked/stacked.dart';

class SendAndReceiveMoneyView extends StatelessWidget {
 const SendAndReceiveMoneyView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SendAndReceiveMoneyViewmodel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => SendAndReceiveMoneyViewmodel(),
   );
 }
}