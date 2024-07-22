import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sensor_app/models/sensor_data.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._();
  static Database? _database;

  DatabaseService._();

  factory DatabaseService() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sensor_data.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sensor_data(id INTEGER PRIMARY KEY, temperature REAL, humidity REAL, timestamp TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertSensorData(SensorData data) async {
    final db = await database;
    await db.insert('sensor_data', data.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<SensorData>> getAllSensorData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('sensor_data');
    return List.generate(maps.length, (i) {
      return SensorData(
        id: maps[i]['id'],
        temperature: maps[i]['temperature'],
        humidity: maps[i]['humidity'],
        timestamp: DateTime.parse(maps[i]['timestamp']),
      );
    });
  }
}
