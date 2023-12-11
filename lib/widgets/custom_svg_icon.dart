import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';

class SvgIconInCircle extends StatelessWidget {
  final String svgAssetPath;
  final double circleSize;
  final Color circleColor;
  final Color? svgColor;
  final VoidCallback? pressed;
  final double? height;
  final double? width;

   SvgIconInCircle({
    super.key,
    required this.svgAssetPath,
    this.circleSize = 48.0,
    this.circleColor = primaryColor,
    this.pressed,
    this.svgColor = black,  this.height,  this.width,
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
              height:height , // You can adjust the size of the SVG icon
              width: width,
              colorFilter: ColorFilter.mode(
                  svgColor!, BlendMode.srcIn) // Set the color of the SVG icon
              ),
        ),
      ),
    );
  }
}
