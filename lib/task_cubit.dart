import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/task_state.dart';
class TaskCubit extends Cubit<TaskState>{
  TaskCubit():super(TaskState(task: []));
}