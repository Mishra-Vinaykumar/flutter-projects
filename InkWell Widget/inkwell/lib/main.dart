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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 11),
                          height: 200,
                          width: 200,
                          color: Colors.lightGreen,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 11),
                          height: 200,
                          width: 200,
                          color: const Color.fromARGB(255, 74, 110, 195),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 11),
                          height: 200,
                          width: 200,
                          color: Colors.deepOrange,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 11),
                          height: 200,
                          width: 200,
                          color: Colors.grey,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 11),
                          height: 200,
                          width: 200,
                          color: Colors.cyan,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  width: 200,
                  color: Colors.lightBlue,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  width: 200,
                  color: Colors.lightBlueAccent,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  width: 200,
                  color: Colors.purple,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  width: 200,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
        ));
  }
}


// ElevatedButton(
//           child: Text('Clicked Me'),
//           onPressed: () => print('Click on Btn'),
//         )


// --------------------------------
// example of Inkwell

// Center(
//             child: InkWell(
//           onTap: () => print('Tapped'),
//           onLongPress: () => print('Long Pressed'),
//           onDoubleTap: () => print('double clicked'),
//           child: Container(
//             width: 200,
//             height: 200,
//             color: const Color.fromARGB(255, 160, 123, 13),
//             child: Center(
//               child: InkWell(
//                 onTap: () => print('Text wiget tapped'),
//                 onDoubleTap: () => print('clicked on text on double clicked'),
//                 child: Text(
//                   'clicked on text',
//                   style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//           ),
//         ))