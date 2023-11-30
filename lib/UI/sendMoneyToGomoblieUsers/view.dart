import 'package:flutter/material.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/viewmodel.dart';
import 'package:stacked/stacked.dart';

class SendMoneyToGomoblieUsersView extends StatelessWidget {
 const SendMoneyToGomoblieUsersView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SendMoneyToGomoblieUsersViewmodel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => SendMoneyToGomoblieUsersViewmodel(),
   );
 }
}