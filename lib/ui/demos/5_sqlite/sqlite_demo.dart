import 'package:flutter/material.dart';
import 'package:flutter_demo/services/service_locator.dart';
import 'package:flutter_demo/ui/demos/5_sqlite/database.dart';
import 'package:drift/drift.dart' as drift;

class SqliteDemo extends StatefulWidget {
  const SqliteDemo({super.key});

  @override
  State<SqliteDemo> createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  final db = getIt<AppDatabase>(); // Use the new AppDatabase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drift Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                db.insertRow(
                  MyTableCompanion(
                    name: const drift.Value('John'),
                    age: const drift.Value(33),
                  ),
                );
              },
              child: const Text('Insert'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final rows = await db.queryAllRows();
                for (var row in rows) {
                  print('ID: ${row.id}, Name: ${row.name}, Age: ${row.age}');
                }
              },
              child: const Text('Query (See Console)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                db.updateRow(
                  const MyTableData(id: 1, name: 'Jonathan', age: 34),
                );
              },
              child: const Text('Update'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                db.deleteRow(1);
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
