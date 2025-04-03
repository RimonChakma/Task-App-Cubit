import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/task_state.dart';
class TaskCubit extends Cubit<TaskState>{
  TaskCubit():super(TaskState(task: []));

  void addTask(String title) {
    if (title.isNotEmpty) {
      final newTask = {'title': title};
      final updatedTasks = List<Map<String, dynamic>>.from(state.task)..add(newTask);
      emit(TaskState(task: updatedTasks));
    }
  }
}