
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp ({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: const Text('Hi this is a flutter app'),
          ),
      ),
    );
  }
}