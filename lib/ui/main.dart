import 'package:flutter/material.dart';
import 'package:lesson_02/ui/2_widget_layout/widgets_layout_demo.dart';
import 'package:lesson_02/ui/3_state_management/state_management_demo.dart';
import '1_dart/dart_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // A ListView for your items
      body: ListView(
        children: [
          ListTile(
            title: const Text("1. Dart Demo"),
            leading: const Icon(Icons.code),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DartDemoScreen()),
              );
            },
          ),


          ListTile(
            title: const Text("2. Widgets and layout"),
            leading: const Icon(Icons.code),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WidgetsLayoutDemo(),
                ),
              );
            },
          ),


          ListTile(
            title: const Text("3. State Management"),
            leading: const Icon(Icons.code),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StateManagementDemo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}