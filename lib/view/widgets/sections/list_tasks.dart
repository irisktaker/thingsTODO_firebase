// ignore_for_file: must_be_immutable

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '/models/task.dart';
import '/utils/colors.dart';
import '/utils/colors_parser.dart';
import '/view/widgets/shared/custom_circle.dart';

class ListTasksSection extends StatefulWidget {
  ListTasksSection(this.tasks, {Key? key}) : super(key: key);

  List<Task> tasks;

  @override
  State<ListTasksSection> createState() => _ListTasksSectionState();
}

class _ListTasksSectionState extends State<ListTasksSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          var task = widget.tasks[index];
          //..

          return InkWell(
            onDoubleTap: () => onDoubleTap(task, index, context),
            onLongPress: () => onLongPress(task, context),
            child: Slidable(
              key: Key(task.id),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: ((context) {
                      setState(() {
                        task.isDone = true;

                        if (task.isDone) {
                          task.id[index];

                          // Navigator.pushNamed(
                          //     context, DoneTaskScreen.screenRoute,
                          //     arguments: task.isDone);
                        }

                        // task.save();
                      });
                    }),
                    backgroundColor: ThemeColors.blueColor,
                    foregroundColor: ThemeColors.whiteColor,
                    icon: Icons.done,
                    label: 'Done',
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      // task.save();
                    }),
                    backgroundColor: ThemeColors.greenColor,
                    foregroundColor: ThemeColors.whiteColor,
                    icon: Icons.save_alt_outlined,
                    label: 'Save',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        task.isLater = true;

                        if (task.isLater) {
                          task.id[index];
                          // Navigator.pushNamed(
                          //     context, LaterTaskScreen.screenRoute);
                        }

                        // task.save();
                      });
                    },
                    backgroundColor: ThemeColors.orangeColor,
                    foregroundColor: ThemeColors.whiteColor,
                    icon: Icons.watch_later_outlined,
                    label: 'Later',
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      setState(() {
                        task.id[index];
                        // task.delete();
                      });
                    }),
                    backgroundColor: ThemeColors.redColor,
                    foregroundColor: ThemeColors.whiteColor,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ThemeColors.whiteColor,
                    border: Border.all(
                      color: ThemeColors.lightGreyColor.withOpacity(0.5),
                    )),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('kk:mm \n a').format(task.createdAt),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    task.taskTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.greyColor,
                      letterSpacing: 1.0,
                    ),
                  ),
                  subtitle: Text(
                    task.taskCategory,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  trailing: SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // --
                        IconButton(
                          onPressed: () {
                            setState(() {
                              task.isFavorite = !task.isFavorite;

                              // task.isFavorite = true;

                              if (task.isFavorite == true) {
                                // Navigator.pushNamed(
                                //     context, ImportantTaskScreen.screenRoute);
                              } else {
                                Navigator.pop(context);
                              }
                            });
                          },
                          icon: task.isFavorite
                              ? const Icon(
                                  Icons.star,
                                  color: ThemeColors.yellowColor,
                                  size: 26,
                                )
                              : const Icon(
                                  Icons.star_border_outlined,
                                  size: 26,
                                ),
                        ),

                        BuildCustomCircle(
                          color:
                              ColorParser.colorList[int.parse(task.taskColor)],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onDoubleTap(Task task, int index, BuildContext context) {
    if (widget.tasks[index] == widget.tasks[index]) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             TaskDetailsScreen(tasks, task, size)));
    }
  }

  void onLongPress(Task task, context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Do you want to edit the task?'),
            actions: [
              TextButton(
                onPressed: () {
                  //TODO: Handle Edit
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             EditTakScreen(widget.tasks, task, widget.size)));
                },
                child: const Text('Edit'),
              )
            ],
          );
        });
  }
}
