class Todo {
  String title;
  String category;


  Todo({required this.title,required this.category});

  Todo.fromMap(Map map) :
        title = map['title'] as String,
        category = map['category'] as String;


  Map toMap() {
    return {
      'title' : title,
      'category' : category,

    };
  }


}