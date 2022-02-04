import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../provider/todo_provider.dart';


class TodoCard extends StatelessWidget {
  TodoCard({Key? key,required this.todo}) : super(key: key);

  Todo todo;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder:(context, state,child){
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(todo.title),
            onLongPress:(){
              state.removeTodo(todo);
            } ,
          ),
        );

      } ,

    );
  }
}
