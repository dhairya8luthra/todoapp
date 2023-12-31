import 'package:flutter/material.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';
class HomePage extends StatefulWidget{
 
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }
  class _HomePageState extends State<HomePage>{
      List todoList =[ ];
  final _controller = TextEditingController();
  void checkBoxChanged(bool? value, int index){
      setState(() {
        todoList[index][1]=!todoList[index][1];
      });
  }
  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();

    });
  }
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return dialog_box(
        controller: _controller,
        OnSave: saveNewTask,
        OnCancel: ()=> Navigator.of(context).pop(),

      );
    });
  }
  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text('TO DO'),
          elevation: 0,
        ),
    floatingActionButton: FloatingActionButton(onPressed: createNewTask,
        child: Icon(Icons.add)),
        body:ListView.builder(itemCount: todoList.length, itemBuilder: (context,index){
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1], 
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context)=> deleteTask(index));
        }));
             
      
    }
  }