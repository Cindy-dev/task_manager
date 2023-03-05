import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:task_manager/src/utilities/cupertino_time_picker.dart';
import 'package:task_manager/src/utilities/device_navigation.dart';
import 'package:task_manager/task/utilities/task_strings/add_task_strings.dart';
import '../../../src/utilities/add_task_button.dart';
import '../../../src/utilities/app_constants/app_colors.dart';
import '../../../src/utilities/app_constants/app_strings.dart';
import '../../../src/utilities/date_impl.dart';
import '../../../src/utilities/time_impl.dart';
import 'tile_container.dart';

Future showSheet(BuildContext context,) => showSlidingBottomSheet(context,
    builder: (context) => const SlidingSheetDialog(
          cornerRadius: 16,
          padding: EdgeInsets.all(15),
          avoidStatusBar: true,
          snapSpec: SnapSpec(
            snappings: [0.4, 0.7, 1],
            initialSnap: 0.7,
          ),
          builder: buildSheet,
        ));

Widget buildSheet(context, state) {
  final impl = Impl();
  return Material(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
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
                        width: 2, color: AppColors.gray.withOpacity(0.3))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 2, color: AppColors.gray.withOpacity(0.3))))),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        TileContainer(
          text: 'Task Time',
          iconHeader: Icons.alarm,
          arrowFwd: Icons.arrow_forward_ios,
          action: TaskManagerTime(
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            type: TaskManagerTimePickerType.time,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TileContainer(
          text: 'Notification',
          iconHeader: Icons.notifications,
          arrowFwd: Icons.arrow_forward_ios,
          action: InkWell(
            onTap: () {
              impl.bottomSheet(context, impl.timePicker((p0) {
                (Duration changedtimer) {
                  // setState(() {
                  //   impl.initialtimer = changedtimer;
                  //   impl.time = changedtimer.inHours.toString() +
                  //       ' hrs ' +
                  //       (changedtimer.inMinutes % 60).toString() +
                  //       ' mins ' +
                  //       (changedtimer.inSeconds % 60).toString() +
                  //       ' secs';
                  // });
                };
              }));
            },
            child: const Text(
              'Select Time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontName,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const TileContainer(
          text: 'Repeat',
          iconHeader: Icons.repeat,
          arrowFwd: Icons.arrow_forward_ios,
          action: Text(
            'No',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: AppStrings.fontName,
            ),
          ),
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
  );
}
