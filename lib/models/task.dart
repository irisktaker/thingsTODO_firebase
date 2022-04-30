import '../utils/utils.dart';

class TaskField {
  static const createdTime = 'createdTime';
}

class Task {
  Task({
    required this.id,
    required this.createdAt,
    required this.taskTitle,
    required this.taskDesc,
    required this.taskColor,
    required this.taskCategory,
    required this.notification,
    required this.taskFinalDate,
    this.isDone = false,
    this.isLater = false,
    this.isFavorite = false,
  });

  String id;
  DateTime createdAt;
  String taskTitle;
  String taskDesc;
  String taskColor;
  String taskCategory;
  String notification;
  DateTime taskFinalDate;
  bool isDone;
  bool isLater;
  bool isFavorite;

  static Task fromJson(Map<String, dynamic> json) => Task(
        createdAt: Utils.toDateTime(json['createdAt'])!,
        id: json['id'],
        taskTitle: json['taskTitle'],
        taskDesc: json['taskDesc'],
        taskColor: json['taskColor'],
        taskCategory: json['taskCategory'],
        notification: json['notification'],
        taskFinalDate: json['taskFinalDate'],
        isDone: json['isDone'],
        isFavorite: json['isFavorite'],
        isLater: json['isLater'],
      );

  Map<String, dynamic> toJson() => {
        'createdAt': Utils.fromDateTimeToJson(createdAt),
        'id': id,
        'taskTitle': taskTitle,
        'taskDesc': taskDesc,
        'taskColor': taskColor,
        'taskCategory': taskCategory,
        'notification': notification,
        'taskFinalDate': taskFinalDate,
        'isDone': isDone,
        'isFavorite': isFavorite,
        'isLater': isLater,
      };
}
