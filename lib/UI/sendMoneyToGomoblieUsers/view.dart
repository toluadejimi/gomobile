import 'package:flutter/material.dart';
import 'package:gomobilez/UI/sendMoneyToGomoblieUsers/viewmodel.dart';
import 'package:stacked/stacked.dart';

class sendMoneyToGomoblieUsersView extends StatelessWidget {
 const sendMoneyToGomoblieUsersView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<sendMoneyToGomoblieUsersViewmodel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => sendMoneyToGomoblieUsersViewmodel(),
   );
 }
}