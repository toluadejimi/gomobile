import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool loading;
  final VoidCallback click;
  final double horizontalPadding, verticalPadding, fontSize;
  final FontWeight fontWeight;
  const SmallButton(
      {required this.text,
      this.color = white,
      this.loading = false,
      required this.click,
      this.horizontalPadding = 45,
      this.verticalPadding = 15,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w700,
      super.key});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            child: LoadingAnimationWidget.inkDrop(
              color: color,
              size: 45,
            ),
          )
        : GestureDetector(
            onTap: () => click(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color != black ? black : white),
              ),
            ),
          );
  }
}
