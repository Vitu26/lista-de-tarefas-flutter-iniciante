import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = []; //sintaxe para criar uma lista de tarefas vazia

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              Container(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(), //adiciona uma linha para dividir os widgets
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tarefas[index]),
                      onLongPress: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              setState(() {
                tarefas = [];
              });
              _textEditingController.clear();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
