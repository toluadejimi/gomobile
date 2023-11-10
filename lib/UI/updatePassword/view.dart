import 'package:flutter/material.dart';
import 'package:gomobilez/UI/updatePassword/viewModel.dart';
import 'package:stacked/stacked.dart';

class UpdatePasswordView extends StatelessWidget {
 const UpdatePasswordView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<UpdatePasswordViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => UpdatePasswordViewModel(),
   );
 }
}