import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking News'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final author = user['title'];
          final desc = user['description'];
          final imageUrl = user['urlToImage'];
          final publish = user['publishedAt'];
          final content = user['content'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.network(imageUrl),
            ),
            // leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(author),
            subtitle: Text(desc),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchusers,
        child: Text("*"),
      ),
    );
  }

  void fetchusers() async {
    print("API Call");
    const url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=1f9f391ea28f4dd19a8483ee9abc7775';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["articles"];
    });
    print("fetchData");
  }
}
