import 'package:flutter/material.dart';
import 'package:things_to_do_firebase/api/firebase_api.dart';

import '../models/task.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks.where((task) => task.isDone == false).toList();
  // isLater and isFavorite ??
  List<Task> get tasksCompleted =>
      _tasks.where((task) => task.isDone == true).toList();

  void setTask(List<Task> tasks) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _tasks = tasks;
      notifyListeners();
    });
  }

  void addTask(Task task) => FirebaseApi.createTask(task);
  void removeTask(Task task) => FirebaseApi.deleteTodo(task);

  bool toggleTaskIsDoneStatus(Task task) {
    task.isDone = !task.isDone;
    FirebaseApi.updateTodo(task);
    return task.isDone;
  }

  bool toggleTaskIsFavoriteStatus(Task task) {
    task.isFavorite = !task.isFavorite;
    FirebaseApi.updateTodo(task);
    return task.isFavorite;
  }

  bool toggleTaskIsLaterStatus(Task task) {
    task.isLater = !task.isLater;
    FirebaseApi.updateTodo(task);
    return task.isLater;
  }

  void updateTask(Task task, String title, String description, String color,
      DateTime finalDate) {
    task.taskTitle = title;
    task.taskDesc = description;
    task.taskColor = color;
    task.taskFinalDate = finalDate;

    FirebaseApi.updateTodo(task);
  }
}
