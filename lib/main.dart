import 'package:flutter/material.dart';
import 'package:flutter_application_api/pages/gen_todoList.dart';
import 'package:flutter_application_api/pages/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/todos': (context) => Gen_todoList(),
      },
    ));
