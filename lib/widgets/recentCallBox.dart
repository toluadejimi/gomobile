import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';

class RecentCallBox extends StatelessWidget {
  const RecentCallBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SvgIconInCircle(
            svgAssetPath: 'assets/images/svg/ci_bulb.svg',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: BaseText(
                    'David Kings',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BaseText(
                  '917-1235-2345',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            color: primaryColor,
            width: 1,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: BaseText(
                    'David Kings',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BaseText(
                  '917-1235-2345',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            color: primaryColor,
            width: 1,
          ),
          SvgPicture.asset('assets/images/svg/solar_phone-calling-outline.svg'),
          SvgPicture.asset('assets/images/svg/mi_message.svg')
        ]),
      ),
    );
  }
}
