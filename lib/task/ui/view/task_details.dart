import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/src/utilities/device_size.dart';
import '../../utilities/task_strings/add_task_imports.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String taskName;
  final String taskDate;
  final String taskDesc;
  const TaskDetailsScreen(
      {Key? key,
      required this.taskName,
      required this.taskDate,
      required this.taskDesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dt = DateTime.parse(taskDate);
    final date = DateFormat.yMMMEd().format(dt);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: context.screenHeight() / 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Task Title:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontName,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  taskName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppStrings.fontName,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight() / 40),
            Row(
              children: [
                const Text(
                  "Task Date:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontName,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  date.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppStrings.fontName,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Task Description:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontName,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              taskDesc,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: AppStrings.fontName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
