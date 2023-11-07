import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/keynoardCharacters.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';

class CallKeyPad extends StatelessWidget {
  final List<List<KeyboardCharacters>> characters = [
    [
      KeyboardCharacters(value: '1', id: '1'),
      KeyboardCharacters(value: '2', id: '2'),
      KeyboardCharacters(value: '3', id: '3'),
    ],
    [
      KeyboardCharacters(value: '4', id: '4'),
      KeyboardCharacters(value: '5', id: '5'),
      KeyboardCharacters(value: '6', id: '6'),
    ],
    [
      KeyboardCharacters(value: '7', id: '7'),
      KeyboardCharacters(value: '8', id: '8'),
      KeyboardCharacters(value: '9', id: '9'),
    ],
    [
      KeyboardCharacters(value: '+', id: '10'),
      KeyboardCharacters(value: '0', id: '0'),
      KeyboardCharacters(value: 'del', id: '11'),
    ]
  ];
  CallKeyPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(children: [
        TextFormField(),
        ...characters.map(
          (character) =>
              (Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ...character.map(
              (ch) => RoundedIconButton(
                click: () => print(ch.value),
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Text(
                    ch.value,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                padding: 0,
                color: primaryColor,
              ),
            ),
          ])),
        ),
        RoundedIconButton(
          click: () => print('call'),
          icon: SvgPicture.asset(
            './assets/images/svg/phone_dial_icon.svg',
            width: 26,
          ),
        )
      ]),
    );
  }
}
