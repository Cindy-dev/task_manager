import 'package:flutter/cupertino.dart';
import 'package:task_manager/src/utilities/device_navigation.dart';
import 'package:task_manager/task/ui/widgets/task_list.dart';
import 'package:task_manager/task/utilities/task_strings/add_task_imports.dart';
import '../../repository/isar_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final isarService = IsarService();
  final _formKey = GlobalKey<FormState>();
  String? time = "";
  Duration initialtimer = const Duration();
  TextEditingController nameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * .065,
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              "Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontName,
              ),
            ),
          ),
          const TaskList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(context, buildSheet),
        backgroundColor: AppColors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

//add task bottom sheet widgets/ui
  Widget buildSheet(context, state) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) state) {
        return Material(
          child: Form(
            key: _formKey,
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
                  controller: dateController,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Task Date Should not be empty";
                    }
                    return null;
                  },
                ),
                gap(),
                AddTextField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Task Name cannot be empty";
                    }
                    return null;
                  },
                  minLines: 1,
                  maxLines: 2,
                  hintText: "Input task name",
                ),
                gap(),
                AddTextField(
                  controller: taskDescriptionController,
                  minLines: 10,
                  maxLines: 40,
                  hintText: AddTaskStrings.hintText,
                ),
                gap(),
                TileContainer(
                  text: 'Task Time',
                  iconHeader: Icons.alarm,
                  arrowFwd: Icons.arrow_forward_ios,
                  action: TaskManagerTime(
                    controller: taskTimeController,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    type: TaskManagerTimePickerType.time,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please choose a task time";
                      }
                      return null;
                    },
                  ),
                ),
                gap(),
                TileContainer(
                  text: 'Notification',
                  iconHeader: Icons.notifications,
                  arrowFwd: Icons.arrow_forward_ios,
                  action: InkWell(
                    onTap: () {
                      bottomSheet(
                          context,
                          //cupertino time picker for the notification implementation
                          CupertinoTimerPicker(
                            mode: CupertinoTimerPickerMode.hms,
                            minuteInterval: 1,
                            secondInterval: 1,
                            initialTimerDuration: initialtimer,
                            onTimerDurationChanged: (Duration changedtimer) {
                              state(() {
                                initialtimer = changedtimer;
                                time =
                                    '${changedtimer.inHours} hrs ${changedtimer.inMinutes % 60} mins';
                              });
                            },
                          ));
                    },
                    child: time == ""
                        ? const Text(
                            'Select Time',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppStrings.fontName,
                            ),
                          )
                        : Text(
                            '$time',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppStrings.fontName,
                            ),
                          ),
                  ),
                ),
                gap(),
                const TileContainer(
                  text: 'Repeat',
                  iconHeader: Icons.repeat,
                  arrowFwd: Icons.arrow_forward_ios,
                  action: Text(
                    'No',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStrings.fontName,
                    ),
                  ),
                ),
                gap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddTaskButton(
                      onTap: () {
                        navigatePop(context);
                      },
                      text: "Cancel",
                      textColor: AppColors.black,
                      containerColor: AppColors.black,
                      containerColor2: AppColors.white,
                    ),
                    const SizedBox(width: 10),
                    AddTaskButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          isarService.buildTask(taskDescriptionController.text,
                              dateController: dateController.text,
                              taskTimeController: taskTimeController.text,
                              time: time!,
                              nameController: nameController.text,
                              repeat: "No");
                          nameController.clear();
                          dateController.clear();
                          taskTimeController.clear();
                          taskDescriptionController.clear();
                        }
                        time = "";
                        navigatePop(context);
                      },
                      text: "Save task",
                      textColor: AppColors.white,
                      containerColor: AppColors.black,
                      containerColor2: AppColors.black,
                    ),
                  ],
                ),
                gap(),
              ],
            ),
          ),
        );
      },
    );
  }

  //spacing between widgets in the modal sheet
  Widget gap() {
    return const SizedBox(
      height: 30,
    );
  }
}
