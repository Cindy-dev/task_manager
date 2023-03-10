import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import '../../../src/utilities/app_constants/app_colors.dart';
import '../../utilities/task_strings/add_task_strings.dart';

// implementing a text field widget to write task
Widget addTextField() {
  return TextFormField(
      minLines: 10,
      maxLines: 40,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          filled: true,
          hintText: AddTaskStrings.hintText,
          fillColor: AppColors.gray.withOpacity(0.3),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(width: 2, color: AppColors.gray.withOpacity(0.3))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2, color: AppColors.gray.withOpacity(0.3)))));
}

//implementation to show sliding bottom sheet for adding new task
Future showSheet(BuildContext context,
        Widget Function(BuildContext, SheetState)? builder) =>
    showSlidingBottomSheet(context,
        builder: (context) => SlidingSheetDialog(
              cornerRadius: 16,
              padding: const EdgeInsets.all(15),
              avoidStatusBar: true,
              snapSpec: const SnapSpec(
                snappings: [0.4, 0.7, 1],
                initialSnap: 0.7,
              ),
              builder: builder,
            ));

