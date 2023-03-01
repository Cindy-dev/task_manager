class AddTaskModel {
  String id;
  String taskDetails;
  String taskDate;
  String taskTime;
  String taskNotification;
  String taskRepeat;

  AddTaskModel(
      {required this.id,
      required this.taskDetails,
      required this.taskTime,
      required this.taskDate,
      required this.taskNotification,
      required this.taskRepeat
      });
}
