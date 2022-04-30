import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'utils/colors.dart';
import 'routes/routes.dart';
import '/provider/tasks_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ThingsTODO',
        theme: ThemeData(
          primaryColor: ThemeColors.primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: ThemeColors.primaryColor,
            elevation: 0,
            centerTitle: false,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: ThemeColors.primaryColor,
              onPrimary: ThemeColors.whiteColor,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
