// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do_firebase/provider/tasks_provider.dart';
import 'package:things_to_do_firebase/utils/colors.dart';

class DoneTasksSection extends StatelessWidget {
  const DoneTasksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO:
    final provider = Provider.of<TasksProvider>(context);

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: size.height * 0.30,
            child: Image.asset(
              "assets/images/img2.png",
            ),
          ),
          const Text(
            "All Done For Now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primaryColor,
            ),
          ),
          Text(
            "Next Task",
            style: TextStyle(
              fontSize: 16,
              color: ThemeColors.greyColor.withOpacity(0.6),
            ),
          ),
          Text(
            "Tomorrow 3:55 PM ",
            // TODO:
            // ${tasks[0].createdAt.day}",
            style: TextStyle(
              fontSize: 16,
              color: ThemeColors.greyColor.withOpacity(0.6),
            ),
          ),
          const Text(
            "Time for a Break",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
