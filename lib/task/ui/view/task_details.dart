import 'package:flutter/material.dart';
import 'package:task_manager/src/utilities/device_navigation.dart';
import 'package:task_manager/src/utilities/device_size.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.screenHeight() / 9;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.screenHeight() / 20, horizontal: 10),
        child: Column(
          children: [
            IconButton(
                onPressed: () => navigatePop(context),
                icon: const Icon(Icons.arrow_back_ios))
          ],
        ),
      ),
    );
  }
}
