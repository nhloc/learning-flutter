import 'package:flutter/material.dart';
import 'package:my_app/presentation/state_management.dart';

void main() {
  runApp(StateManagementPage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StateManagementPage(),
    );
  }
}