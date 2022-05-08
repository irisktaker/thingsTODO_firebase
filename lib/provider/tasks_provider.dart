import 'package:flutter/material.dart';

import '../models/task.dart';
import '/api/firebase_api.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  get doneTask => _tasks.where((t) => t.isDone == false).toList();
  get laterTask => _tasks.where((t) => t.isLater == false).toList();
  get favoriteTask => _tasks.where((t) => t.isFavorite == false).toList();
  get tasksCompleted => _tasks.where((t) => t.isDone == true).toList();

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

  void addTask(Task task) => FirebaseApi.createTask(task);

  void removeTask(Task task) => FirebaseApi.deleteTodo(task);

  void setTask(List<Task> tasks) {
    _tasks = tasks;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void updateTask(
    Task task,
    String title,
    String description,
    String color,
    DateTime finalDate,
  ) {
    task.taskTitle = title;
    task.taskDesc = description;
    task.taskColor = color;
    task.taskFinalDate = finalDate;

    FirebaseApi.updateTodo(task);
  }
}
