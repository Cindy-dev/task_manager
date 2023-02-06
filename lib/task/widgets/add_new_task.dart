import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_manager/task/utilities/task_strings/add_task_strings.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';
import 'package:task_manager/utilities/device_size.dart';

import '../../utilities/app_constants/app_strings.dart';

Future<dynamic> addNewTask(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return
          Container(
          margin: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.horizontal_rule,
                  size: 60,
                  color: AppColors.gray,
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
                  height: 10,
                ),
                SfCalendar(
                  todayHighlightColor: AppColors.primaryColor,
                  view: CalendarView.timelineMonth,
                ),
                const SizedBox(
                  height: 50,
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
                                width: 2, color: AppColors.gray.withOpacity(0.3))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  BorderSide(
                                width: 2, color: AppColors.gray.withOpacity(0.3))))),

              ],
            ),
          ),
        );
      });
}
