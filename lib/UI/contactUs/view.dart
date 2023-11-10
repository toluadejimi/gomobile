import 'package:flutter/material.dart';
import 'package:gomobilez/UI/contactUs/viewModel.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
 const ContactUsView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ContactUsViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
        body: Container(
          child: Text('Here'),
        ),
      ),
     viewModelBuilder: () => ContactUsViewModel(),
   );
 }
}