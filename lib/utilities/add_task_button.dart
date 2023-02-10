import 'package:flutter/material.dart';
import 'package:task_manager/utilities/device_size.dart';
import 'app_constants/app_colors.dart';
import 'app_constants/app_strings.dart';

class AddTaskButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color containerColor;
  final Color containerColor2;
  const AddTaskButton({Key? key, required this.text, required this.textColor, required this.containerColor, required this.containerColor2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: context.screenHeight() / 15,
      width: context.screenWidth() / 2.5,
      decoration: BoxDecoration(
          color: containerColor2,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: containerColor,
          )),
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontName),
      ),
    );
  }
}
