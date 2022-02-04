import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todo_list.dart';

import '/models/item.dart';
import '/models/todo.dart';
import '/provider/todo_provider.dart';

class ItemAdd extends StatefulWidget {
  ItemAdd({Key? key,required this.item}) : super(key: key);
  Item item;

  @override
  State<ItemAdd> createState() => _ItemAddState();
}

class _ItemAddState extends State<ItemAdd> {
  var taskControl = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context,listen: false).initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('To-do List',
          style: TextStyle(color: Colors.purple,
          fontSize: 20),),
          ToDoList(title : widget.item.title),
          ElevatedButton(
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return SingleChildScrollView(
                    child: AlertDialog(
                      title: const Text('Add Todo'),
                      content: SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autofocus: true,
                                controller: taskControl,
                                validator: (value) {
                                  if(value == '') {
                                    return 'Task cant be empty';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(border: OutlineInputBorder(),
                                    labelText: 'Task'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              bool validResult = formKey.currentState!.validate();
                              if (validResult == true) {
                                Todo todo =
                                Todo(title: taskControl.text, category: widget.item.title);
                                Provider.of<TodoProvider>(context,listen: false).addTodo(todo);
                                taskControl.text = '';
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Add')),
                        TextButton(
                        onPressed: () {
                            Navigator.pop(context);
                  },
                            child: const Text('Cancel')),

                      ],
                    ),
                  );
                });
              },
              child: const Text('ADD',
          style: TextStyle(color: Colors.white),)),
      ],
      ),
    );
  }
}
