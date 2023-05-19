import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'todo_card.dart';
import 'todo.dart';

class Gen_todoList extends StatefulWidget {
  const Gen_todoList({super.key});

  @override
  State<Gen_todoList> createState() => _Gen_todoListState();
}

class _Gen_todoListState extends State<Gen_todoList> {
  Future<Map> getData(String num) async {
    final Response response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/' + num));
    final Map data = jsonDecode(response.body);
    return data;
  }

  int counter = 1;

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Generate todos'),
        centerTitle: true,
        elevation: 0, //remove shadow
      ), // app bar 사용 -> safe area 쓸 필요 x
      body: SingleChildScrollView(
        child: Column(
          children: todos
              .map((todo) => // execute for each items
                  TodoCard(
                    todo: todo,
                    delete: () {
                      setState(() {
                        todos.remove(todo);
                      });
                    },
                  ))
              .toList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData(counter.toString()).then((value) {
            Todo todo = Todo(
                userID: value['userId'],
                id: value['id'],
                title: value['title'],
                completed: value['completed']);
            setState(() {
              todos.add(todo);
            });
          });
          counter += 1;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
