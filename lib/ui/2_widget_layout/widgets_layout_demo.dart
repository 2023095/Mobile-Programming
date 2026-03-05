import 'package:flutter/material.dart';

class WidgetsLayoutDemo extends StatelessWidget {
  const WidgetsLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets and Layout')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Hello'),
              Text('World'),
              Text('and MIU'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.travel_explore),
              ),
              IconButton(
                onPressed: () {
                  print('hello');
                },
                icon: Icon(Icons.waving_hand),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Elevated button was clicked!');
                },
                child: Text('Click me'),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  print('Outlined button was clicked!');
                },
                child: Text('Click me'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  print('Text button was clicked!');
                },
                child: Text('Click me', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
