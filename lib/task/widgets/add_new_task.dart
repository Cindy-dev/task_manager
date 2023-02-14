import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_manager/task/utilities/task_strings/add_task_strings.dart';
import 'package:task_manager/task/widgets/tile_container.dart';
import 'package:task_manager/utilities/add_task_button.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';
import 'package:task_manager/utilities/device_navigation.dart';
import 'package:task_manager/utilities/device_size.dart';
import '../../utilities/date_time_impl.dart';
import '../../utilities/app_constants/app_strings.dart';

Future<dynamic> addNewTask(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height / 1.5,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onVerticalDragUpdate: (_) => navigatePop(context),
                  child: const Icon(
                    Icons.horizontal_rule,
                    size: 60,
                    color: AppColors.gray,
                  ),
                ),
                const Text(
                  AddTaskStrings.heading,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppStrings.fontName,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TaskManagerDateTime(
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    minLines: 10,
                    maxLines: 40,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: AddTaskStrings.hintText,
                        fillColor: AppColors.gray.withOpacity(0.3),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 2,
                                color: AppColors.gray.withOpacity(0.3))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 2,
                                color: AppColors.gray.withOpacity(0.3))))),
                const SizedBox(
                  height: 30,
                ),
                const TileContainer(
                  text: 'Task Time',
                  iconHeader: Icons.alarm,
                  arrowFwd: Icons.arrow_forward_ios,
                  time: '4:00 PM',
                ),
                const SizedBox(
                  height: 30,
                ),
                const TileContainer(
                  text: 'Notification',
                  iconHeader: Icons.notifications,
                  arrowFwd: Icons.arrow_forward_ios,
                  time: 'in 5 min',
                ),
                const SizedBox(
                  height: 30,
                ),
                const TileContainer(
                  text: 'Repeat',
                  iconHeader: Icons.repeat,
                  arrowFwd: Icons.arrow_forward_ios,
                  time: 'No',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AddTaskButton(
                      text: "Cancel",
                      textColor: AppColors.black,
                      containerColor: AppColors.black,
                      containerColor2: AppColors.white,
                    ),
                    AddTaskButton(
                      text: "Save task",
                      textColor: AppColors.white,
                      containerColor: AppColors.black,
                      containerColor2: AppColors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      });
}
