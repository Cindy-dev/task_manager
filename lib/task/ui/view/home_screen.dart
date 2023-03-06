import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:task_manager/src/utilities/device_navigation.dart';
import 'package:task_manager/task/utilities/task_strings/home_strings.dart';
import 'package:task_manager/src/utilities/device_size.dart';
import '../../../src/utilities/add_task_button.dart';
import '../../../src/utilities/app_constants/app_colors.dart';
import '../../../src/utilities/app_constants/app_strings.dart';
import '../../../src/utilities/cupertino_time_picker.dart';
import '../../../src/utilities/date_impl.dart';
import '../../../src/utilities/time_impl.dart';
import '../../utilities/task_strings/add_task_strings.dart';
import '../widgets/add_new_task.dart';
import '../widgets/tile_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
          SlideTransition(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSheet();
        },
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add),
      ),
    ); // This is the result.
  }

  Future showSheet() => showSlidingBottomSheet(context,
      builder: (context) => SlidingSheetDialog(
            cornerRadius: 16,
            padding: EdgeInsets.all(15),
            avoidStatusBar: true,
            snapSpec: SnapSpec(
              snappings: [0.4, 0.7, 1],
              initialSnap: 0.7,
            ),
            builder: buildSheet,
          ));

  String? time;
  Duration initialtimer = new Duration();

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double? height}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: height ?? MediaQuery.of(context).size.height / 3,
            child: child));
  }

  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          time = changedtimer.inHours.toString() +
              ' hrs ' +
              (changedtimer.inMinutes % 60).toString() +
              ' mins ' +
              (changedtimer.inSeconds % 60).toString() +
              ' secs';
        });
      },
    );
  }

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
                  bottomSheet(context, timePicker());
                print(time.toString());
              },
              child: time == null
                  ? Text(
                      'Select Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppStrings.fontName,
                      ),
                    )
                  : Text('$time'),

              // const Text(
              //   'Select Time',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w600,
              //     fontFamily: AppStrings.fontName,
              //   ),
              // ),
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
