import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/Todo.dart';
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
    _reloadList();
  }
  _reloadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('list');
    if(data!= null){
      setState(() {
        var objs = jsonDecode(data) as List;
        list = objs.map((obj) => Todo.fromJson(obj)).toList();
      });
    }
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
                  builder: (context) => TodoItem(todo: list[index]),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoItem(todo: null,))),
      ),
    );
  }
}
