import 'package:flutter/cupertino.dart';
import 'package:task_manager/task/utilities/task_strings/add_task_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? time;
  Duration initialtimer = const Duration();

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(
            height: height * .065,
          ),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSheet(context, buildSheet);
        },
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  //cupertino time picker for the notification implementation
  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          time =
              '${changedtimer.inHours} hrs ${changedtimer.inMinutes % 60} mins ${changedtimer.inSeconds % 60} secs';
        });
      },
    );
  }

//add task bottom sheet widgets/ui
  Widget buildSheet(context, state) {
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
          addTextField(),
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
          time == null ? Container() : Text('$time'),
          TileContainer(
            text: 'Notification',
            iconHeader: Icons.notifications,
            arrowFwd: Icons.arrow_forward_ios,
            action: InkWell(
              onTap: () {
                bottomSheet(context, timePicker());
              },
              child: time == null
                  ? const Text(
                      'Select Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppStrings.fontName,
                      ),
                    )
                  : Text('$time'),
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
}
