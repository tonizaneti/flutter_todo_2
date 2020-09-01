import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/Todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  TodoItem({Key key, @required this.todo}) : super (key: key);
  @override
  _TodoItemState createState() => _TodoItemState(todo);
}

class _TodoItemState extends State<TodoItem> {
  Todo _todo;
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  _TodoItemState(Todo todo){
    this._todo = todo;
    if(_todo !=null)
      {
        _tituloController.text = _todo.titulo;
        _descricaoController.text = _todo.descricao;
      }

  }

  _saveItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Todo> list = [];

    var data = prefs.getString('list');
    if (data != null) {
      var objs = jsonDecode(data) as List;
      list = objs.map((obj) => Todo.fromJson(obj)).toList();
    }

    _todo = Todo.fromTituloDescricao(
        _tituloController.text, _descricaoController.text);
        list.add(_todo);
        prefs.setString('list', jsonEncode(list));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Todo Item - Toni Zaneti')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _tituloController,
              decoration: InputDecoration(hintText: 'Título'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descricaoController,
              decoration: InputDecoration(hintText: 'Descrição'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _saveItem(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
