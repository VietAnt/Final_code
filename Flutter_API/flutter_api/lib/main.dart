import 'package:flutter/material.dart';
import 'package:flutter_api/state.dart';
import 'package:flutter_api/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: HomePage(),
    );
  }
}
