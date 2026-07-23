import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase {
  static Database? _instance;
  static const String _dbName = 'notes.db';
  static const int _dbVersion = 1;
  static const String _notesTable = 'notes';

  SqliteDatabase._();

  static Future<Database> get instance async {
    _instance ??= await _initDatabase();
    return _instance!;
  }

  static Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}/$_dbName';

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_notesTable (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL,
        isPinned INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // Create index on updatedAt for better query performance
    await db.execute('''
      CREATE INDEX idx_updatedAt ON $_notesTable(updatedAt DESC)
    ''');

    // Create index on isPinned for filtering pinned notes
    await db.execute('''
      CREATE INDEX idx_isPinned ON $_notesTable(isPinned)
    ''');
  }

  static Future<void> close() async {
    final db = _instance;
    if (db != null) {
      await db.close();
      _instance = null;
    }
  }
}
