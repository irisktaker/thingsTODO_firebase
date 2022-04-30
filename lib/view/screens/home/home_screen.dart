import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:things_to_do_firebase/api/firebase_api.dart';
import 'package:things_to_do_firebase/models/task.dart';
import 'package:things_to_do_firebase/provider/tasks_provider.dart';

import '/view/widgets/tabs/daily_tab.dart';
import '/view/widgets/tabs/weekly_tab.dart';
import '/view/widgets/tabs/monthly_tab.dart';
import '/view/widgets/shared/custom_drawer.dart';
import '/view/widgets/shared/home_screen_app_bar.dart';

import 'home_bloc.dart';

HomeBloc _bloc = HomeBloc();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const screenRoute = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          drawer: const CustomDrawer(),
          body: StreamBuilder<List<Task>>(
            stream: FirebaseApi.readTasks(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (!snapshot.hasError) {
                    print("error: ${snapshot.connectionState}");
                    return const Center(
                        child: Text('Something Went Wrong Try later'));
                  } else {
                    List<Task>? tasks = snapshot.data;

                    final provider = Provider.of<TasksProvider>(context);
                    provider.setTask(tasks!);

                    return NestedScrollView(
                      controller: _bloc.scrollController,
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          homeScreenAppBar(
                            context,
                            setState,
                            innerBoxIsScrolled,
                            _bloc.tabController,
                          ),
                        ];
                      },
                      body: TabBarView(
                        controller: _bloc.tabController,
                        children: const [
                          DailyTODOScreen(),
                          WeeklyTODOScreen(),
                          MonthlyTODOScreen(),
                        ],
                      ),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
