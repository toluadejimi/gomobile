import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/UI/message/getNumber/addNewNumber.dart';
import 'package:gomobilez/UI/message/getNumber/noActiveNumber.dart';
import 'package:gomobilez/UI/message/viewModel.dart';
import 'package:gomobilez/widgets/base_text.dart';

class GetNumber extends StatelessWidget {
  final MessageViewModel model;
  const GetNumber({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: model.user,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var user = snapshot.data;
            if (user!.myNumber != null) {
              return AddNewNumber(model: model);
            } else {
              return NoActiveNumber(model: model);
            }
          } else {
            return BaseText(
              '...',
              fontSize: 50.sp,
              fontWeight: FontWeight.bold,
            );
          }
        }));
  }
}
