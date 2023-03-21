import 'package:isar/isar.dart';

part 'add_task_db.g.dart';

@Collection()
class AddTaskDB {
  Id id = Isar.autoIncrement;
  late String? taskDetails;
  late String taskDate;
  late String taskTime;
  late String taskNotification;
  late String taskRepeat;
  late String taskName;
}