import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
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
              ElevatedButton(onPressed: (){}, child: Icon(Icons.check))
            ],
          ),
          
        ],
      ),),
    );
  }
}

