import 'package:isar/isar.dart';

import 'entities/add_task_db.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      //Passing my collection schema to a new Open Isar instance
      return await Isar.open(
        [AddTaskDBSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> createTask(AddTaskDB newTask) async {
    final isar = await db;
    // Insert or update tasks
    isar.writeTxnSync<int>(() => isar.addTaskDBs.putSync(newTask));
  }

  Stream<List<AddTaskDB>> getAllTasks() async* {
    final isar = await db;
    yield* isar.addTaskDBs.where().watch(fireImmediately: true);
  }


  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
