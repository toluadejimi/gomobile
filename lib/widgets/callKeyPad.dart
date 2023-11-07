import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/keynoardCharacters.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:pinput/pinput.dart';

class CallKeyPad extends StatefulWidget {
  const CallKeyPad({super.key});

  @override
  State<CallKeyPad> createState() => _CallKeyPadState();
}

TextEditingController _controller = TextEditingController();

class _CallKeyPadState extends State<CallKeyPad> {
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

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 45, 0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: primaryColor),
            ),
          ),
          child: TextFormField(
              controller: _controller,
              showCursor: true,
              readOnly: true,
              style: const TextStyle(fontSize: 25, letterSpacing: 2),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(55, 10, 5, 0),
                border: InputBorder.none,
                hintText: 'Enter Phone Number',
                suffixIcon: Container(
                  // padding: const EdgeInsets.only(right: 10),
                  margin: const EdgeInsets.only(bottom: 15),
                  child: SvgPicture.asset(
                    './assets/images/svg/phone_dialer_textfield_icon.svg',
                    width: 15,
                  ),
                ),
              )),
        ),
      ),
      const SizedBox(
        height: 100,
      ),
      ...characters.map(
        (character) => Column(
          children: [
            (Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ...character.map(
                (ch) => RoundedIconButton(
                  click: () => setState(() {
                    if (ch.value == 'del') {
                      _controller.delete();
                      return;
                    } else {
                      _controller.text = _controller.text + ch.value;
                      return;
                    }
                  }),
                  icon: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text(
                        ch.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                  padding: 0,
                  color: primaryColor,
                ),
              ),
            ])),
            const SizedBox(height: 20)
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      RoundedIconButton(
        color: green,
        click: () => print('call'),
        icon: SvgPicture.asset(
          './assets/images/svg/phone_dial_icon.svg',
          width: 26,
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ]);
  }
}
