import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Color Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define a variable to hold the background color
  Color _backgroundColor = Colors.white;
  // Random _random = Random();

  // Define a function to change the background color
  void _changeBackgroundColor() {
    setState(() {
      // Generate a random color
      _backgroundColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Color Changer'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: Text('Change Background Color Randomly'),
          ),
        ),
      ),
    );
  }
}
