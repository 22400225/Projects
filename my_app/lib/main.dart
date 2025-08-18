import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Flutter'),
        ),
        body: const Center(
          child: Text(
            '안녕하세요! Flutter 예시입니다.',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

