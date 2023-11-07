import 'package:flutter/material.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/custom_svg_icon.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key,
      required this.asset,
      required this.title,
      required this.description,});
  final String asset;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: ((context) => ProductDetails(
        //         ))));
      },
      child: Container(
        width: 150,
        height: 148,
        decoration: ShapeDecoration(
          color: white.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgIconInCircle(svgAssetPath: asset)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: BaseText(title,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                ),
              ),
              BaseText(description,
              fontSize: 16,
                color: grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
