import 'package:flutter/material.dart';

class SqliteDemo extends StatelessWidget {
  const SqliteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('insert')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('query')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('update')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('delete')),
          ],
        ),
      ),
    );
  }
}
