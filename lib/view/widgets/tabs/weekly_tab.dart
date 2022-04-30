import 'package:flutter/material.dart';

class WeeklyTODOScreen extends StatelessWidget {
  const WeeklyTODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      padding: const EdgeInsets.all(0),
      children: [Center(child: Text("Weekly Todo"))],
    );
  }
}
