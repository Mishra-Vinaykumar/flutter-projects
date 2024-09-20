// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import '../providers/user_provider.dart';
import 'ticket_form_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Tickets'),
        actions: [
          if (userProvider.user != null) // Show this if logged in
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(
                    context); // Logout functionality to be implemented
              },
            ),
        ],
      ),
      body: Consumer<TicketProvider>(
        builder: (context, provider, child) {
          if (provider.tickets.isEmpty) {
            return Center(child: Text('No tickets available.'));
          }
          return ListView.builder(
            itemCount: provider.tickets.length,
            itemBuilder: (context, index) {
              final ticket = provider.tickets[index];
              return ListTile(
                title: Text(ticket.movieName),
                subtitle: Text('${ticket.showTime} - Seats: ${ticket.seats}'),
                trailing: IconButton(
                  icon: Icon(Icons.book),
                  onPressed: () {
                    // Book ticket functionality to be implemented
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: userProvider.user == null // Admin functionality
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketFormScreen()),
                );
              },
              child: Icon(Icons.add),
            ),
    );
  }
}
