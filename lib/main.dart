import 'package:flutter/material.dart';
import 'page2.dart';
// import file homepage.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TanikuApp(), // Menjalankan halaman dari homepage.dart
    );
  }
}
