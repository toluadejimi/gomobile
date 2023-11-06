import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final String hint;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double padding;
  final bool obscureText, enableSuggestions, autocorrect;
  const InputField(
      {Key? key,
      this.textInputFormatter,
      this.errorText,
      this.validator,
      this.prefixIcon,
      this.keyboardType,
      this.suffixIcon,
      this.controller,
      this.onChanged,
      this.onSaved,
      this.padding = 10,
      required this.hint,
      this.obscureText = false,
      this.enableSuggestions = true,
      this.autocorrect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: const TextStyle(color: grey),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            style: const TextStyle(fontSize: 12, height: 1.5),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: errorText,
              fillColor: transparentWhite,
              filled: true,
              hoverColor: white,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: white, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: transparentWhite, width: 0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
            controller: controller,
            cursorColor: primaryColor,
            keyboardType: keyboardType,
            inputFormatters: textInputFormatter,
            obscureText: obscureText,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
          ),
        ],
      ),
    );
  }
}
