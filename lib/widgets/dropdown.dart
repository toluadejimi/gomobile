import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomobilez/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DropDown extends StatelessWidget {
  final String? Function(Object?)? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final String hint;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(Object?)? onChanged;
  final Function(Object?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Object? value;
  final double padding;
  final bool loading;
  final List<DropdownMenuItem<Object?>>? items;
  final bool obscureText, enableSuggestions, autocorrect, hintOut;
  const DropDown(
      {Key? key,
      this.textInputFormatter,
      this.errorText,
      this.validator,
      this.prefixIcon,
      this.keyboardType,
      this.suffixIcon,
      this.value,
      this.controller,
      this.onChanged,
      this.onSaved,
      this.loading = false,
      this.padding = 8,
      required this.hint,
      required this.items,
      this.obscureText = false,
      this.enableSuggestions = true,
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
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<Object?>(
              value: value,
              icon: loading
                  ? Container(
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.inkDrop(
                        color: black,
                        size: 10.sp,
                      ),
                    )
                  : Icon(
                      Icons.arrow_drop_down,
                    ),
              items: items,
              style: TextStyle(fontSize: 12.sp, height: 1.5.sp, color: black),
              decoration: InputDecoration(
                hintText: !hintOut ? hint : '',
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                errorText: errorText,
                fillColor: transparentWhite,
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
              onChanged: (val) => onChanged!(val),
              // onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }
}
