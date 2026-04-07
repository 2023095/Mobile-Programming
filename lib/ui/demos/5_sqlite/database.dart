import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbName = 'my_database.db';
  static const _dbVersion = 1;

  static const table = 'myTable';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  late Database _database;

  Future<void> init() async {
    final folder = await getApplicationDocumentsDirectory();
    final path = join(folder.path, _dbName);
    _database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final sql =
        '''
CREATE TABLE $table (
$columnId INTEGER PRIMARY KEY,
$columnName TEXT NOT NULL,
$columnAge INTEGER NOT NULL
)
''';
    await db.execute(sql);
  }
}