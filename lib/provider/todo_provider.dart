import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';
import '../widgets/shared_pref_helper.dart';

class TodoProvider with ChangeNotifier{
  List<Todo> todos=[];

  SharedPreferences? sharedPreferences;
  UnmodifiableListView<Todo> get alltodos=>UnmodifiableListView(todos);
 // UnmodifiableListView<Todo> get completedtodos=>UnmodifiableListView(todos.where((todo) => todo.completed));


  // Todo Methods
  void addTodo(Todo todo) {
    todos.add(todo);
    saveDataToLocalStorage();
    notifyListeners();

  }
  void removeTodo(Todo todo) {
    todos.remove(todo);
    updateDataToLocalStorage();
    notifyListeners();

  }

// SP Methods
  void initSharedPreferences() async {
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadDataFromLocalStorage();
    notifyListeners();
  }

  void saveDataToLocalStorage() {
    List<String>? spList = todos.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list',spList);
  }


  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      todos = spList.map((item) => Todo.fromMap(json.decode(item))).toList();
    }
  }

  void updateDataToLocalStorage() {
    sharedPreferences!.remove('list');
    saveDataToLocalStorage();
  }
}




