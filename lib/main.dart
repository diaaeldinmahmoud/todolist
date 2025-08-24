import 'package:flutter/material.dart';
import 'package:todolist/screens/HomeView.dart';

void main() {
  runApp(const todoapp());
}

class todoapp extends StatelessWidget {
  const todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
