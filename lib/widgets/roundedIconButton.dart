import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class RoundedIconButton extends StatelessWidget {
  final double padding;
  final VoidCallback click;
  final Widget icon;
  final Color color;
  const RoundedIconButton(
      {super.key,
      required this.click,
      required this.icon,
      this.padding = 15,
      this.color = white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: icon,
      ),
    );
  }
}
