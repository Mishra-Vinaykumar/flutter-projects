// lib/models/ticket.dart
class Ticket {
  final int? id;
  final String movieName;
  final String showTime;
  final int seats;

  Ticket(
      {this.id,
      required this.movieName,
      required this.showTime,
      required this.seats});

  // Convert a Ticket into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'movieName': movieName,
      'showTime': showTime,
      'seats': seats,
    };
  }

  // Extract a Ticket object from a Map.
  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'],
      movieName: map['movieName'],
      showTime: map['showTime'],
      seats: map['seats'],
    );
  }
}
