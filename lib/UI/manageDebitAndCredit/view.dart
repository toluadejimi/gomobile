import 'package:flutter/material.dart';
import 'package:gomobilez/UI/manageDebitAndCredit/viewmodel.dart';
import 'package:stacked/stacked.dart';

class ManageDebitAndCreditView extends StatelessWidget {
 const ManageDebitAndCreditView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ManageDebitAndCreditViewmodel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => ManageDebitAndCreditViewmodel(),
   );
 }
}