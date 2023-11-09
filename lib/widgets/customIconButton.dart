import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomIconButton extends StatelessWidget {
  final Widget widget;
  final Color color;
  final bool loading;
  final VoidCallback click;
  final double horizontalPadding, verticalPadding, radius;
  const CustomIconButton(
      {required this.widget,
      this.color = white,
      this.loading = false,
      required this.click,
      this.horizontalPadding = 45,
      this.verticalPadding = 15,
      this.radius = 10,
      super.key});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
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
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
              child: widget,
            ),
          );
  }
}
