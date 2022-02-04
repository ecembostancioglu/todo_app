import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todo_card.dart';
import '/provider/todo_provider.dart';

class ToDoList extends StatelessWidget {
  ToDoList({Key? key,required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.3,
      width:  MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Consumer<TodoProvider>(
        builder: (context, state,child) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: state.alltodos.where((todo) => todo.category.contains(title)).length,
            itemBuilder: ( context,  index)
            => TodoCard(todo:state.alltodos.where((todo) => todo.category.contains(title)).toList()[index]),
          );
        }
      ),
    );
  }
}
