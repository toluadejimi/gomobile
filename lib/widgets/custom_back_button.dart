import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding:  EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back,
              color: black,
            ),
          ),
        );
  }
}