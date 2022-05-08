import 'package:flutter/material.dart';
import '/view/screens/home/home_screen.dart';
import '/view/screens/login/login_screen.dart';
import '/view/screens/register/register_screen.dart';
import '../view/screens/tasks_screens/new_task_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginScreen(),
  RegisterScreen.screenRoute: (context) => const RegisterScreen(),
  HomeScreen.screenRoute: (context) => const HomeScreen(),
  NewTaskScreen.screenRoute: (context) => const NewTaskScreen(),
//   ImportantTaskScreen.screenRoute: (context) => const ImportantTaskScreen(),
//   DoneTaskScreen.screenRoute: (context) => const DoneTaskScreen(),
//   LaterTaskScreen.screenRoute: (context) => const LaterTaskScreen(),
};
