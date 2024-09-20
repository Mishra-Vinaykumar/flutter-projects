// lib/db/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/ticket.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE tickets(id INTEGER PRIMARY KEY AUTOINCREMENT, movieName TEXT, showTime TEXT, seats INTEGER)",
        );
        db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)",
        );
      },
      version: 1,
    );
  }

  // Ticket operations
  Future<void> insertTicket(Ticket ticket) async {
    final db = await database;
    await db.insert('tickets', ticket.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Ticket>> tickets() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tickets');
    return List.generate(maps.length, (i) {
      return Ticket.fromMap(maps[i]);
    });
  }

  Future<void> updateTicket(Ticket ticket) async {
    final db = await database;
    await db.update(
      'tickets',
      ticket.toMap(),
      where: "id = ?",
      whereArgs: [ticket.id],
    );
  }

  Future<void> deleteTicket(int id) async {
    final db = await database;
    await db.delete(
      'tickets',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // User operations
  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User?> getUser(String username) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
