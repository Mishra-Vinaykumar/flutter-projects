// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:moviebooking/ticket_provider.dart';
import 'package:provider/provider.dart';
import '../db/database_helper.dart';
import '../models/ticket.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TicketProvider _ticketProvider;

  @override
  void initState() {
    super.initState();
    _ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    _ticketProvider.fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Ticket Booking'),
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
                  icon: Icon(Icons.edit),
                  onPressed: () => _editTicket(ticket),
                ),
                onLongPress: () => _deleteTicket(ticket.id!),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTicket,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTicket() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TicketFormScreen(),
      ),
    );
  }

  void _editTicket(Ticket ticket) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TicketFormScreen(ticket: ticket),
      ),
    );
  }

  void _deleteTicket(int id) {
    _ticketProvider.deleteTicket(id);
  }
}

class TicketFormScreen extends StatefulWidget {
  final Ticket? ticket;

  TicketFormScreen({this.ticket});

  @override
  _TicketFormScreenState createState() => _TicketFormScreenState();
}

class _TicketFormScreenState extends State<TicketFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _movieName;
  late String _showTime;
  late int _seats;

  @override
  void initState() {
    super.initState();
    if (widget.ticket != null) {
      _movieName = widget.ticket!.movieName;
      _showTime = widget.ticket!.showTime;
      _seats = widget.ticket!.seats;
    } else {
      _movieName = '';
      _showTime = '';
      _seats = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ticket == null ? 'Add Ticket' : 'Edit Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _movieName,
                decoration: InputDecoration(labelText: 'Movie Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter movie name';
                  }
                  return null;
                },
                onSaved: (value) => _movieName = value!,
              ),
              TextFormField(
                initialValue: _showTime,
                decoration: InputDecoration(labelText: 'Show Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter show time';
                  }
                  return null;
                },
                onSaved: (value) => _showTime = value!,
              ),
              TextFormField(
                initialValue: _seats.toString(),
                decoration: InputDecoration(labelText: 'Seats'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of seats';
                  }
                  return null;
                },
                onSaved: (value) => _seats = int.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final ticket = Ticket(
        id: widget.ticket?.id,
        movieName: _movieName,
        showTime: _showTime,
        seats: _seats,
      );

      if (widget.ticket == null) {
        Provider.of<TicketProvider>(context, listen: false).addTicket(ticket);
      } else {
        Provider.of<TicketProvider>(context, listen: false)
            .updateTicket(ticket);
      }

      Navigator.of(context).pop();
    }
  }
}
