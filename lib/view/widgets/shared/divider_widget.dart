// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '/utils/colors.dart';

class DividerWidget extends StatelessWidget {
  double? size;

  DividerWidget({ Key? key , this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(
          thickness: 1.1,
          color: ThemeColors.lightGreyColor,
        ),
      ),
    );
  }
}