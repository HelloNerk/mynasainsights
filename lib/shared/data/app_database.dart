import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'apod_database.db';
  final String tableName = 'apods';

  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            copyright TEXT,                   
            date TEXT,                  
            explanation TEXT,                                         
            hdurl TEXT,                           
            media_type TEXT,
            service_version TEXT,
            title TEXT,
            url TEXT                              
          )
        ''');
      },
    );
    return _db as Database;
  }
}

