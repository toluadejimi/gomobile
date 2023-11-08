import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/widgets/base_text.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.asset,
    required this.title,
    required this.description,
  });
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
        height: 148,
        decoration: ShapeDecoration(
          color: white36,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: RoundedIconButton(
                      color: primaryColor,
                      click: () {},
                      icon: SvgPicture.asset(asset))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BaseText(
                  title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              BaseText(
                description,
                fontSize: 16,
                color: textGrey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
