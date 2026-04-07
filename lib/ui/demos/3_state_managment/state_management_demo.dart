import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/demos/3_state_managment/state_management_manager.dart';

class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  final manager = StateManagementManager();

  @override
  void initState() {
    super.initState();
    manager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Management')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ValueListenableBuilder<Color>(
              valueListenable: manager.colorNotifier,
              builder: (context, color, child) {
                return Container(
                  color: color,
                  width: 200,
                  height: 200,
                  child: Center(
                    child: ValueListenableBuilder(
                      valueListenable: manager.numberNotifier,
                      builder: (context, value, child) {
                        return Text('$value', style: TextStyle(fontSize: 50));
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: manager.changeColor,
              child: Text('Change color'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: manager.changeText,
              child: Text('Change text'),
            ),
          ],
        ),
      ),
    );
  }
}
