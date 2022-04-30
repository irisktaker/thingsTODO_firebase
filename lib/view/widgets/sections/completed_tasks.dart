import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '/utils/colors.dart';
import '/provider/tasks_provider.dart';
import 'package:provider/provider.dart';
import '/utils/singleton/singleton.dart';

class CompletedTasksSection extends StatelessWidget {
  const CompletedTasksSection(tasks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    final tasks = provider.tasksCompleted;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: const BoxDecoration(
        color: ThemeColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                Singleton.instance.greeting(),
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              const Text(
                " Naser",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "TODAY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryColor,
                    fontSize: 22),
              ),
              Text(
                "Completed",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.greenColor,
                    fontSize: 18),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                width: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // "${tasksList.where((element) => element.isDone).toList().length}/",
                      "$tasks",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.greenColor,
                          fontSize: 20),
                    ),
                    Text(
                      tasks.length.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.redColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
