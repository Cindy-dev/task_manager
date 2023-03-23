import 'package:isar/isar.dart';

part 'add_task_db.g.dart';

@Collection()
class AddTaskDB {
  Id id = Isar.autoIncrement;
  String? taskDetails;
  String? taskDate;
  String? taskTime;
  String? taskNotification;
  String? taskRepeat;
  String? taskName;
}
