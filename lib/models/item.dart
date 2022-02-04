import 'dart:convert';
import 'package:flutter/material.dart';

class Item{
  final String title;
  //final IconData icon;

// Item({required this.title, required this.icon});
 Item({required this.title});

 Item.fromMap(Map map):
      title = map['title'] as String;
    //  icon = map['icon'] as IconData;
 Map toMap(){
   return {
     'title' : title,
   //  'icon' :icon,
   };
 }


}

