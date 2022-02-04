import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/grid_items_provider.dart';
import '../widgets/category_add.dart';
import '../widgets/item_card.dart';


class TodayToDosPage extends StatefulWidget {
  const TodayToDosPage({Key? key}) : super(key: key);

  @override
  State<TodayToDosPage> createState() => _TodayToDosPageState();
}


class _TodayToDosPageState extends State<TodayToDosPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<GridItems>(context,listen: false).initSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<GridItems>(
          builder: (context, state,child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                   childAspectRatio: 2/2),
                       itemCount: state.categories.length ,
                       itemBuilder: (context,index){
                  return GridTile(
                       child:ItemCard(item:state.categories[index] ),
              );
              }
            )
             );
          }
        ),
     ),
           floatingActionButton: FloatingActionButton(
              onPressed: () {
                 showDialog(context: (context),
                 builder: (context)=>const AddCategorize());
                },
                  child: const Icon(Icons.add),
      ),
    );
  }
}
