import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class MyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
}

@DriftDatabase(tables: [MyTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertRow(MyTableCompanion row) => into(myTable).insert(row);
  Future<List<MyTableData>> queryAllRows() => select(myTable).get();
  Future<bool> updateRow(MyTableData row) => update(myTable).replace(row);
  Future<int> deleteRow(int id) =>
      (delete(myTable)..where((t) => t.id.equals(id))).go();
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'my_app_db',
    // You MUST provide DriftWebOptions for the web to work.
    // It is safely ignored when running on Android/iOS.
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
