import 'package:flutter/material.dart';
import 'package:things_to_do_firebase/utils/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // TODO:
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
          height: 200,
          color: ThemeColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {});
                  onTap = !onTap;
                },
                onDoubleTap: () {},
                child: CircleAvatar(
                  backgroundColor: onTap ? Colors.amber : null,
                  radius: 50,
                  child: CircleAvatar(
                    backgroundImage: const NetworkImage(
                      "https://images.unsplash.com/photo-1647281536088-569165944e97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
                    ),
                    radius: onTap ? 45 : 50,
                  ),
                ),
              ),
              const Text(
                "Naser Sami",
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: size.height,
            child: ListView.builder(
              itemCount: drawerList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, drawerList[index]['screen']);
                },
                child: ListTile(
                  leading: Icon(
                    drawerList[index]['icon'],
                    size: 30,
                  ),
                  title: Text(
                    drawerList[index]['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      color: ThemeColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> drawerList = [
  // {
  //   'icon': Icons.add,
  //   'title': "New Task",
  //   'screen': NewTaskScreen.screenRoute,
  // },
  // {
  //   'icon': Icons.star_border_outlined,
  //   'title': "Important",
  //   'screen': ImportantTaskScreen.screenRoute,
  // },
  // {
  //   'icon': Icons.done,
  //   'title': "Done",
  //   'screen': DoneTaskScreen.screenRoute,
  // },
  // {
  //   'icon': Icons.watch_later_outlined,
  //   'title': "Later",
  //   'screen': LaterTaskScreen.screenRoute,
  // },
  // {
  //   'icon': Icons.category_outlined,
  //   'title': "Category",
  //   'screen': LaterTaskScreen.screenRoute,
  // },
  // {
  //   'icon': Icons.settings,
  //   'title': "Settings",
  //   'screen': LaterTaskScreen.screenRoute,
  // },
  // {
  //   'icon': Icons.logout,
  //   'title': "Logout",
  //   'screen': '/',
  // },
];
