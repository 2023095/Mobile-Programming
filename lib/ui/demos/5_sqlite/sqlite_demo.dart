import 'package:flutter/material.dart';
import 'package:flutter_demo/services/service_locator.dart';
import 'package:flutter_demo/ui/demos/5_sqlite/database.dart';

class SqliteDemo extends StatefulWidget {
  const SqliteDemo({super.key});

  @override
  State<SqliteDemo> createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  final db = getIt<DatabaseHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final row = {
                  DatabaseHelper.columnName: 'John',
                  DatabaseHelper.columnAge: 33,
                };
                db.insert(row);
              },
              child: Text('insert'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final rows = await db.queryAllRows();
                print(rows);
              },
              child: Text('query'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final row = {
                  DatabaseHelper.columnId: 1,
                  DatabaseHelper.columnName: 'Jonathan',
                  DatabaseHelper.columnAge: 33,
                };
                db.update(row);
              },
              child: Text('update'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                db.delete(1);
              },
              child: Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}