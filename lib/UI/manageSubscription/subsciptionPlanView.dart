import 'package:flutter/material.dart';
import 'package:gomobilez/UI/manageSubscription/viewModel.dart';
import 'package:stacked/stacked.dart';

class subsciptionPlanView extends StatelessWidget {
 const subsciptionPlanView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ManageSubscriptionViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => ManageSubscriptionViewModel(),
   );
 }
}