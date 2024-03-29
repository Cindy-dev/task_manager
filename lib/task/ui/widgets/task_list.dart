import 'package:flutter/material.dart';
import 'package:task_manager/src/utilities/device_navigation.dart';
import 'package:task_manager/task/repository/entities/add_task_db.dart';
import 'package:task_manager/task/repository/isar_service.dart';
import 'package:task_manager/task/ui/view/task_details.dart';
import '../../../src/utilities/app_constants/app_colors.dart';
import '../../../src/utilities/app_constants/app_strings.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with TickerProviderStateMixin {
  final isarService = IsarService();

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Expanded(
        child: StreamBuilder<List<AddTaskDB>>(
            stream: isarService.getAllTasks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tasks = snapshot.data;
                if (tasks!.isEmpty) {
                  return const Center(child: Text('No Task found'));
                }
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: Dismissible(
                        secondaryBackground: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(Icons.delete),
                            ),
                          ),
                        ),
                        background: Container(),
                        key: ValueKey<AddTaskDB>(tasks[index]),
                        onDismissed: (DismissDirection direction) {
                          isarService.deleteItem(tasks[index].id);
                        },
                        child: GestureDetector(
                          onTap: () => navigatePush(
                              context,
                              TaskDetailsScreen(
                                taskName: tasks[index].taskName.toString(),
                                taskDate: tasks[index].taskDate.toString(),
                                taskDesc: tasks[index].taskDetails.toString(),
                              )),
                          child: Container(
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.gray.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tasks[index].taskName!,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppStrings.fontName,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Every ${tasks[index].taskNotification}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: AppStrings.fontName,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
