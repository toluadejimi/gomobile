import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:gomobilez/models/keyboardCharacters.dart';
import 'package:gomobilez/widgets/roundedIconButton.dart';
import 'package:pinput/pinput.dart';

class CallKeyPad extends StatefulWidget {
  final void Function(String number, {String? name}) call;
  final VoidCallback click;
  const CallKeyPad({super.key, required this.call, required this.click});

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
              style: TextStyle(fontSize: 20.sp, letterSpacing: 2),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(55.w, 10.h, 5.w, 0),
                border: InputBorder.none,
                hintText: 'Enter Phone Number',
                suffixIcon: GestureDetector(
                  onTap: widget.click,
                  child: Container(
                    // padding: const EdgeInsets.only(right: 10),
                    margin: EdgeInsets.only(bottom: 15.h),
                    child: SvgPicture.asset(
                      './assets/images/svg/phone_dialer_textfield_icon.svg',
                      width: 15,
                    ),
                  ),
                ),
              )),
        ),
      ),
      SizedBox(
        height: 80.h,
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
                    width: 45.w,
                    height: 45.h,
                    child: Center(
                      child: Text(
                        ch.value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.sp),
                      ),
                    ),
                  ),
                  padding: 0,
                  color: primaryColor,
                ),
              ),
            ])),
            SizedBox(height: 18.h)
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      RoundedIconButton(
        color: green,
        click: () {
          widget.call(
            _controller.text,
          );
          _controller.clear();
        },
        icon: SvgPicture.asset(
          './assets/images/svg/phone_dial_icon.svg',
          width: 24.w,
        ),
      ),
      SizedBox(
        height: 40.h,
      ),
    ]);
  }
}
