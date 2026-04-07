import 'package:flutter/material.dart';
import 'package:flutter_demo/app_state.dart';
import 'package:flutter_demo/services/auth/auth.dart';
import 'package:flutter_demo/services/local_storage/local_storage.dart';
import 'package:flutter_demo/services/service_locator.dart';
import 'package:flutter_demo/ui/demos/2_widget_layout/widgets_layout_demo.dart';
import 'package:flutter_demo/ui/demos/3_state_managment/state_management_demo.dart';
import 'package:flutter_demo/ui/demos/4_user_login/login_screen.dart';
import 'package:flutter_demo/ui/settings/settings_screen.dart';
import 'ui/demos/1_dart/dart_demo_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<LocalStorage>().init();
  await getIt<Auth>().init();
  await getIt<AppState>().init();
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: FlutterLogo()),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
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
            title: const Text("3. State management"),
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

          ListTile(
            title: const Text("4. User login"),
            leading: const Icon(Icons.code),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}