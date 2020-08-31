import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> list = [];



  @override
  void initState() {
    super.initState();

    Todo todo = Todo();
    todo.titulo='Titulo Teste';
    todo.descricao='Descricao Testers';
    setState(() {
      list.add(todo);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('TodoApp - Toni Zaneti'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${list[index].titulo}'),
            subtitle: Text('${list[index].descricao}'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoItem(),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoItem())),
      ),
    );
  }
}
