// lib/providers/ticket_provider.dart
import 'package:flutter/material.dart';
import 'db/database_helper.dart';
import 'models/ticket.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [];

  List<Ticket> get tickets => _tickets;

  Future<void> fetchTickets() async {
    _tickets = await DatabaseHelper().tickets();
    notifyListeners();
  }

  Future<void> addTicket(Ticket ticket) async {
    await DatabaseHelper().insertTicket(ticket);
    fetchTickets();
  }

  Future<void> updateTicket(Ticket ticket) async {
    await DatabaseHelper().updateTicket(ticket);
    fetchTickets();
  }

  Future<void> deleteTicket(int id) async {
    await DatabaseHelper().deleteTicket(id);
    fetchTickets();
  }
}
