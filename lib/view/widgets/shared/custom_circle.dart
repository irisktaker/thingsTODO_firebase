// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BuildCustomCircle extends StatelessWidget {
  BuildCustomCircle(
      {Key? key,
      required this.color,
      this.radius = 10,
      this.child,
      this.onPressed})
      : super(key: key);

  Color color;
  double? radius;
  Widget? child;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: child,
      ),
    );
  }
}
