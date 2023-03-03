import 'package:equatable/equatable.dart';

class AddTaskModel extends Equatable {
  final String id;
  final String taskDetails;
  final String taskDate;
  final String taskTime;
  final String taskNotification;
  final String taskRepeat;

  const AddTaskModel(
      {required this.id,
      required this.taskDetails,
      required this.taskTime,
      required this.taskDate,
      required this.taskNotification,
      required this.taskRepeat});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
