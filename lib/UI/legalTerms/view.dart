import 'package:flutter/material.dart';
import 'package:gomobilez/UI/legalTerms/viewModel.dart';
import 'package:stacked/stacked.dart';

class LegalTermsView extends StatelessWidget {
 const LegalTermsView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<LegalTermsViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
      body:Container(child: Text('Here'),),
     ),
     viewModelBuilder: () => LegalTermsViewModel(),
   );
 }
}