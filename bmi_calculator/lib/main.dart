import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 36, 5, 90)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Flutter Container'),
        ),
        body: Center());
  }
}



// ElevatedButton(
//           child: Text('Elevated Button'),
//           onPressed: () {
//             print('Button Pressed');
//           },
// --------------------------------------

// Center(Color.fromARGB(255, 109, 123, 147)ild: Container(
//             width: 200,
//             height: 100,
//             color: Colors.blueAccent,
//           ),
// ------------------------------
//  Center(
//             child: Text(
//           'hellow',
//           style: TextStyle(fontSize: 25),
// ------------------------------

// Center(
//           child: Container(
//         width: 100,
//         height: 100,
//         color: Colors.limeAccent,
//         child: Text('Hello worlds'),