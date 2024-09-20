// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show BuildContext, Container, ElevatedButton, MaterialApp, Scaffold, StatelessWidget, Text, Widget, runApp;
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: ElevatedButton(
              child: Text('data'),
              onPressed: print('Click me');
            )));
  }
}


// SizedBox(
//         height: 380,
//         width: 300,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'A',
//               style: TextStyle(fontSize: 25),
//             ),
//             Text(
//               'B',
//               style: TextStyle(fontSize: 25),
//             ),
//             Text(
//               'C',
//               style: TextStyle(fontSize: 25),
//             ),
//             Text(
//               'D',
//               style: TextStyle(fontSize: 25),
//             ),
//             // ElevatedButton(data: 'datachild: Text('child'))
//           ],
//         ),
//       )),