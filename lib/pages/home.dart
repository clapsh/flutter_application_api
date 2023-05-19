import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context,
                  '/todos'); //push another(named route) screen on top of it
            }, // navigate screen
            icon: Icon(Icons.list),
            label: Text('todo generation'),
            style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.brown[600],
                padding: EdgeInsets.all(20)),
          )
        ],
      )),
    );
  }
}
