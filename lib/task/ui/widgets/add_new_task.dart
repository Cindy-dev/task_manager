import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import '../../../src/utilities/app_constants/app_colors.dart';

// implementing a text field widget to write task
class AddTextField extends StatefulWidget {
  final int minLines;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  const AddTextField(
      {Key? key,
      required this.controller,
      required this.minLines,
      required this.maxLines,
      this.validator, required this.hintText})
      : super(key: key);

  @override
  State<AddTextField> createState() => _AddTextFieldState();
}

class _AddTextFieldState extends State<AddTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        cursorColor: AppColors.primaryColor,
        validator: widget.validator,
        decoration: InputDecoration(
            filled: true,
            hintText: widget.hintText,
            fillColor: AppColors.gray.withOpacity(0.3),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2, color: AppColors.gray.withOpacity(0.3))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2, color: AppColors.gray.withOpacity(0.3)))));
  }
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
