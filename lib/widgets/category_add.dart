import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/constants/app_text_constants.dart';
import '/models/item.dart';
import '/provider/grid_items_provider.dart';


class AddCategorize extends StatefulWidget {
  const AddCategorize({Key? key}) : super(key: key);


  @override
  State<AddCategorize> createState() => _AddCategorizeState();
}

class _AddCategorizeState extends State<AddCategorize> {
  SharedPreferences? sharedPreferences ;

  @override
  void initState() {
    super.initState();
    Provider.of<GridItems>(context,listen: false).initSharedPreferences();
  }

  var categorizeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppTextConstants.addCategory),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(20))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (value) {
              if(value == '') {
                return 'Title cant be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),labelText: 'Title', ),
            autofocus: true,
            controller: categorizeController,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (){
                Item item= Item(title:categorizeController.text);
                Provider.of<GridItems>(context,listen: false).addCategorize(item);
                Navigator.pop(context);
                  },
                  child: const Text(AppTextConstants.addCategory)),
          )
        ],
      ),


    );
  }
}


