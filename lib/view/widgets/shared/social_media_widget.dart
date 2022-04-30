import 'package:flutter/material.dart';

import '/utils/colors.dart';
import 'custom_circle.dart';
import 'divider_widget.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DividerWidget(
              size: size.width / 2 - 70,
            ),
            const Text(
              "OR",
              style: TextStyle(
                fontSize: 18,
                color: ThemeColors.lightGreyColor,
              ),
            ),
            DividerWidget(
              size: size.width / 2 - 70,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            "login using social media",
            style: TextStyle(
              fontSize: 16,
              color: ThemeColors.greyColor.withOpacity(0.4),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildCustomCircle(
              onPressed: () {},
              color: const Color(0xFF3d5097),
              radius: 24,
              child: Image.asset(
                "assets/icons/facebook.png",
                width: 20,
                height: 20,
                color: ThemeColors.whiteColor,
              ),
            ),
            BuildCustomCircle(
              onPressed: () {},
              color: const Color(0xFF0098f3),
              radius: 24,
              child: Image.asset(
                "assets/icons/twitter.png",
                width: 20,
                height: 20,
                color: ThemeColors.whiteColor,
              ),
            ),
            BuildCustomCircle(
              onPressed: () {},
              color: const Color(0xFFf7243a),
              radius: 24,
              child: Image.asset(
                "assets/icons/google-plus-logo.png",
                width: 20,
                height: 20,
                color: ThemeColors.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
