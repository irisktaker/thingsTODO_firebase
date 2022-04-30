// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '/utils/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  String hintText;
  Widget? prefixIcon;
  TextEditingController? controller;
  bool obscureText;
  String? Function(String?)? validator;

  TextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
    this.obscureText = false,
     this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(
        color: ThemeColors.greyColor,
      ),
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ThemeColors.lightGreyColor,
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
