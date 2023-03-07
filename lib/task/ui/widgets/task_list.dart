import 'package:flutter/material.dart';

import '../../../src/utilities/app_constants/app_colors.dart';
import '../../../src/utilities/app_constants/app_strings.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with TickerProviderStateMixin {

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
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(_animationController),
      child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Text Uchechukwu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppStrings.fontName,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Every 5 minutes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppStrings.fontName,
                ),
              ),
            ],
          )),
    );
  }
}
