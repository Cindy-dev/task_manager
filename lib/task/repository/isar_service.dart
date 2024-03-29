import 'package:flutter/cupertino.dart';
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

  Future<void> createTask(
    AddTaskDB newTask,
  ) async {
    final isar = await db;
    // Insert or update tasks
    isar.writeTxnSync<int>(() => isar.addTaskDBs.putSync(newTask));
  }

  Future<void> buildTask(
    String taskDescriptionController, {
    required String dateController,
    required String taskTimeController,
    required String time,
    required String repeat,
    required String nameController,
  }) async {
    final task = AddTaskDB()
      ..taskDetails = taskDescriptionController
      ..taskDate = dateController
      ..taskTime = taskTimeController
      ..taskNotification = time!
      ..taskName = nameController
      ..taskRepeat = repeat;
    createTask(task);
  }

  Stream<List<AddTaskDB>> getAllTasks() async* {
    final isar = await db;
    yield* isar.addTaskDBs.where().watch(fireImmediately: true);
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<void> deleteItem(int id) async {
    final isar = await openIsar();
    final itemIdToDelete = id; // user-selected id
    await isar.writeTxn(() async {
      await isar.addTaskDBs.delete(itemIdToDelete); // delete
    });
  }
}
