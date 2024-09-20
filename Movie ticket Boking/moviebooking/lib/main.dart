// lib/main.dart
import 'package:flutter/material.dart';
import 'package:moviebooking/ticket_provider.dart';
import 'package:provider/provider.dart';
import 'db/database_helper.dart';
import 'models/ticket.dart';
import 'home_screen.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TicketProvider()),
      ],
      child: MaterialApp(
        title: 'Movie Ticket Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
