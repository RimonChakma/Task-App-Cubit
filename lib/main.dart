
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/task_cubit.dart';
import 'package:task_app/task_state.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TaskCubit(),child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    ),
    );
  }
}


class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});
  @override
  Widget build(BuildContext context) {

    TextEditingController taskController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Task App"),centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(10),child: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  hintText: "add task"
              ),),),
              SizedBox(width:10,),
              ElevatedButton(onPressed: (){
                context.read<TaskCubit>().addTask(taskController.text.toString());
              }, child: Icon(Icons.check)),
              SizedBox(height: 10,),

            ],
          ),

          Expanded(
            child: BlocBuilder <TaskCubit,TaskState> (builder: (context, state) {
              return ListView.builder(
                itemCount: state.task.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.task[index]["title"].toString()),
                    trailing: IconButton(onPressed: (){
                      context.read<TaskCubit>().removeTask(index);
                    }, icon: Icon(Icons.delete)),
                  );
                },);
            }
            ),
          )

        ],
      ),),
    );
  }
}

