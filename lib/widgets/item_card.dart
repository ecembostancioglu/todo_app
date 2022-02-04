import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants/app_color_constants.dart';
import '/models/item.dart';
import '/provider/grid_items_provider.dart';
import '/provider/todo_provider.dart';
import 'item_add.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.item}) : super(key: key);
   final Item item;


  @override
  Widget build(BuildContext context) {

    return GridView.count(
      crossAxisCount: 1,
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing:10,
      mainAxisSpacing: 20,
      children: <Widget>[
        Consumer<GridItems>(
          builder: (context, state,child) {
            return SizedBox(
              width:160,
              height: 160,
              child: GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                      context: context, builder: (context)=>ItemAdd(item: item,));
                },
                onLongPress:(){
                  state.deleteCategorize(item);
                },
                child: Card(
                  color: AppColorConstants.white,
                  elevation: 2.0,
                  shape:  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                  ),
                  child:Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(item.title,
                                style: const TextStyle(color: AppColorConstants.purple)),
                          ),
                           Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Consumer<TodoProvider>(
                              builder: (context, state,child) {
                                return Text(
                                  'to-do (${state.alltodos.where((todo) => todo.category.contains(item.title)).length})',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                  ),
                                );
                              }
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(100, 20, 0, 0),
                            child: Icon(Icons.assignment,
                                color: AppColorConstants.purple,
                                size: 22),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            );
          },
        )],
    );

  }
}
