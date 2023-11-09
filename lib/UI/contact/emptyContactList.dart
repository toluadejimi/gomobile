import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/UI/contact/viewModel.dart';
import 'package:gomobilez/widgets/callKeyPad.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class ContactEmptyList extends StatelessWidget {
  final ContactViewModel model;
  const ContactEmptyList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      child: Stack(
        children: [
          const Center(
            child: Text(
              'NO RECENT LIST',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: RoundedIconButton(
                click: () => model.showButtomModalSheet(
                    context: context, child: const CallKeyPad(), curve: 0),
                icon: SvgPicture.asset(
                  './assets/images/svg/icon_contact_off.svg',
                  width: 26,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
