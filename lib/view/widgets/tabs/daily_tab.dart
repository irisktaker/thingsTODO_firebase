// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/task.dart';
import '/api/firebase_api.dart';
import '/provider/tasks_provider.dart';
import '/view/widgets/sections/list_tasks.dart';
import '/view/widgets/sections/done_tasks.dart';
import '/view/widgets/sections/completed_tasks.dart';

class DailyTODOScreen extends StatelessWidget {
  DailyTODOScreen(this.tasks, {Key? key}) : super(key: key);

  List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    // ...
    // tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    tasks = tasks
        .where(
          (element) =>
              element.taskFinalDate.day == DateTime.now().day &&
              element.taskFinalDate.month == DateTime.now().month &&
              element.taskFinalDate.year == DateTime.now().year,
        )
        .toList();

    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        // --
        CompletedTasksSection(tasks),

        // --
        (tasks.isNotEmpty) ? ListTasksSection(tasks) : DoneTasksSection(tasks),
      ],
    );
  }
}
