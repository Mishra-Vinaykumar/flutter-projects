// lib/screens/ticket_form_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import '../models/ticket.dart';

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
