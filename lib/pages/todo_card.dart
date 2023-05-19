import 'package:flutter/material.dart';
import 'todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback delete;

  const TodoCard({
    super.key,
    required this.todo,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'id :' + todo.id.toString(),
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 6), // children사이에 빈공간 만들기
          Text(
            'title :' + todo.title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'completed :' + todo.completed.toString(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
            onPressed: delete, // 함수를 data가 있는 곳으로 넘겨줌으로써 data delete
            label: const Text('delete quote'),
            icon: const Icon(Icons.delete),
          )
        ]),
      ),
    );
  }
}
