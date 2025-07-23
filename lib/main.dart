import 'package:flutter/material.dart';
import 'package:wisatabandung/main_screen.dart';
import 'detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Bandung",
      theme: ThemeData(fontFamily: "Oswald", primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}
