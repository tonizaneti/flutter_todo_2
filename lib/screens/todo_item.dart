import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();


}

class _TodoItemState extends State<TodoItem> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  _saveItem() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chave', 'Teste de Valor');
    debugPrint(prefs.getString('chave'));

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
            child:    TextField(
              controller: _tituloController,
              decoration: InputDecoration(hintText: 'Título'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                  hintText: 'Descrição'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child:RaisedButton(
                  child: Text('Salvar', style: TextStyle(
                    fontSize: 16.0,
                  ),),
                color: Colors.green,
                textColor: Colors.white,
                  onPressed: () =>_saveItem(),
                ),
            ),
          )


        ],
      ),
    );
  }
}
