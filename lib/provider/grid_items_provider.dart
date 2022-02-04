import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/widgets/shared_pref_helper.dart';
import '/models/item.dart';


class GridItems with ChangeNotifier{
  List<Item> categories=[
      Item(title:'Home'),
      Item(title:'School'),
      Item(title:'Personal'),
      Item(title:'Work'),
      Item(title:'Flutter'),

  ];



  SharedPreferences? sharedPreferences;


  UnmodifiableListView<Item> get allcategories=>UnmodifiableListView(categories);

  void addCategorize(Item item){
    categories.add(item);
    saveDataToLocalStorage();
    notifyListeners();
  }


  void deleteCategorize(Item item){
    categories.remove(item);
    updateDataToLocalStorage();
    notifyListeners();

  }
  //Shared Preferences
// SP Methods
  void initSharedPreferences() async {
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadDataFromLocalStorage();
    notifyListeners();
  }
  // Save Data - Shared Preferences
  void saveDataToLocalStorage() {
    List<String>? spList = categories.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('categorylist',spList);
  }
  // Load Data - Shared Preferences
  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('categorylist');
    if (spList != null) {
      categories =
          spList.map((item) => Item.fromMap(json.decode(item))).toList();
    }


  }
  void updateDataToLocalStorage() {
    sharedPreferences!.remove('categorylist');
    saveDataToLocalStorage();
  }
}


