// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do_firebase/models/task.dart';
import 'package:things_to_do_firebase/provider/tasks_provider.dart';

import 'package:things_to_do_firebase/view/widgets/sections/completed_tasks.dart';
import 'package:things_to_do_firebase/view/widgets/sections/done_tasks.dart';
import 'package:things_to_do_firebase/view/widgets/sections/list_tasks.dart';

class DailyTODOScreen extends StatefulWidget {
  const DailyTODOScreen({Key? key}) : super(key: key);

  @override
  State<DailyTODOScreen> createState() => _DailyTODOScreenState();
}

class _DailyTODOScreenState extends State<DailyTODOScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    List<Task> tasks = provider.tasks;

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
        (tasks.isNotEmpty)
            ? ListTasksSection(
                task: tasks,
              )
            : const DoneTasksSection(),
      ],
    );
  }
}
