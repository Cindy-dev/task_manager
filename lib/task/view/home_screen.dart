import 'package:flutter/material.dart';
import 'package:task_manager/task/utilities/task_strings/home_strings.dart';
import 'package:task_manager/task/widgets/add_new_task.dart';
import 'package:task_manager/utilities/app_constants/app_colors.dart';
import 'package:task_manager/utilities/device_size.dart';
import '../../utilities/app_constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: height * .065,),
          Container(
            margin: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: const Text(
              HomeStrings.priority,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontName,
              ),
            ),
          ),
          Container(
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSheet(context);
          //addNewTask(context);
        },
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
