import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final dbPath = await getDatabasesPath();
  print(dbPath);
  return openDatabase(
    join(dbPath, 'session.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(firstName TEXT, lastName TEXT, email TEXT, username TEXT PRIMARY KEY, token TEXT)',
      );
    },
    version: 1,
  );
}

Future<String> getTokenFromDb() async {
  final db = await getDatabase();
  final List<Map<String, dynamic>> maps =
      await db.query('users', columns: ['token']);

  if (maps.isNotEmpty) {
    return maps.first['token'];
  } else {
    return ''; // Return an empty string if no token is found
  }
}

Future<void> clearTable() async {
  final dbPath = await getDatabasesPath();
  final db = await openDatabase(join(dbPath, 'session.db'));

  const String tableName = 'users';
  await db.delete(tableName);
}
