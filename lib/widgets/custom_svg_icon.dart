import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class SvgIconInCircle extends StatelessWidget {
  final String svgAssetPath;
  final double circleSize;
  final Color circleColor;
  final Color? svgColor;
  final VoidCallback? pressed;

  const SvgIconInCircle({
    super.key,
    required this.svgAssetPath,
    this.circleSize = 48.0,
    this.circleColor = primaryColor,
     this.pressed,
    this.svgColor = black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Center(
        child: GestureDetector(
          onTap: pressed,
          child: SvgPicture.asset(svgAssetPath,
              height: circleSize * 0.6, // You can adjust the size of the SVG icon
              width: circleSize * 0.6,
              colorFilter: ColorFilter.mode(
                  svgColor!, BlendMode.srcIn) // Set the color of the SVG icon
              ),
        ),
      ),
    );
  }
}
