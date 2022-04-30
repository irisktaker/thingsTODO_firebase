import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:things_to_do_firebase/utils/utils.dart';

import '/models/task.dart';

class FirebaseApi {
  //.. Create a task
  //..
  static Future<DocumentReference<Map<String, dynamic>>> createTask(
      Task task) async {
    final docTask = FirebaseFirestore.instance.collection('tasks').doc();
    task.id = docTask.id;
    await docTask.set(task.toJson());
    return docTask;
  }

  //..Read a task
  //..
  static Stream<List<Task>> readTasks() => FirebaseFirestore.instance
      .collection('tasks')
      .orderBy(TaskField.createdTime, descending: true)
      .snapshots()
      .transform(
        Utils.transformer(Task.fromJson) as dynamic,
      );

  //..Update a task
  //..
  static Future updateTodo(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('tasks').doc(task.id);

    await docTask.update(task.toJson());
  }

  //..Delete a task
  //..
  static Future deleteTodo(Task task) async {
    final docTask = FirebaseFirestore.instance.collection('tasks').doc(task.id);

    await docTask.delete();
  }
}
