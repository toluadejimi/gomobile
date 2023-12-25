import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final String hint;
  final String? errorText;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double padding;
  final FocusNode? focusNode;
  final bool obscureText, enableSuggestions, autocorrect, hintOut, readOnly, showCursor;
  const InputField(
      {Key? key,
      this.textInputFormatter,
      this.errorText,
      this.validator,
      this.prefixIcon,
      this.keyboardType,
      this.suffixIcon,
      this.controller,
      this.fillColor = transparentWhite,
      this.onChanged,
      this.onSaved,
      this.focusNode,
      this.padding = 8,
      this.autofocus = false,
      required this.hint,
      this.obscureText = false,
      this.enableSuggestions = true,
      this.readOnly = false,
      this.showCursor =true,
      this.hintOut = true,
      this.autocorrect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: hintOut,
            child: Text(
              hint,
              style: const TextStyle(color: grey),
            ),
          ),
          SizedBox(
            height: hintOut ? 5.h : 0,
          ),
          TextFormField(
            style: TextStyle(fontSize: 12.sp, height: 1.5.sp),
            autofocus: autofocus!,
            decoration: InputDecoration(
              hintText: !hintOut ? hint : '',
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: errorText,
              fillColor: fillColor,
              filled: true,
              hoverColor: white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: white, width: 1.w),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: transparentWhite, width: 0),
              ),
              prefixIconColor: black,
              suffixIconColor: black,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.w),
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
            focusNode: focusNode,
            readOnly: readOnly,
            showCursor: showCursor,
          ),
        ],
      ),
    );
  }
}
