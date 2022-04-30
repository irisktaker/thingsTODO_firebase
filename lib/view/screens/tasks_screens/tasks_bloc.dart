import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do_firebase/models/task.dart';
import 'package:things_to_do_firebase/provider/tasks_provider.dart';
import 'package:things_to_do_firebase/utils/colors_parser.dart';

class TasksBloc {
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  final taskCategoryController = TextEditingController();
  final taskNotificationController = TextEditingController();

  Color selectedColor = Colors.black;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context, setState) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool fieldsValidator() {
    if (taskTitleController.text.isEmpty) {
      return false;
    } else if (taskDescriptionController.text.isEmpty) {
      return false;
    } else if (taskCategoryController.text.isEmpty) {
      return false;
    } else if (taskNotificationController.text.isEmpty) {
      return false;
    } else if (selectedDate.toString().isEmpty) {
      return false;
    } else if (selectedColor == Colors.black) {
      return false;
    }

    return true;
  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Field are required'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void addNewTask(BuildContext context) {
    if (fieldsValidator()) {
      var task = Task(
        id: DateTime.now().toString(),
        taskTitle: taskTitleController.text,
        taskCategory: taskCategoryController.text,
        taskColor:
            ColorParser().takeColorAndReturnIndex(selectedColor).toString(),
        taskDesc: taskDescriptionController.text,
        taskFinalDate: selectedDate,
        notification: taskNotificationController.text,
        createdAt: DateTime.now(),
      );

      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.addTask(task);

      print(provider.tasks);

      Navigator.pop(context);
    } else {
      showToast(context);
    }
  }
}
