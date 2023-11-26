import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';

class ButtonAndIcon extends StatelessWidget {
  const ButtonAndIcon({super.key, required this.height, required this.width, required this.icon, required this.color,required this.text, required this.fontWeight, this.fontSize, required this.textColor, });
final double height;
  final double width;
  final IconData icon;
  final Color color;
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor, 
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 6,),
            Expanded(
              child: Center(
                child: BaseText(
                  text,
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
