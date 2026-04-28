import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/demos/6_networking/networking_manager.dart';

class NetworkingDemo extends StatefulWidget {
  const NetworkingDemo({super.key});

  @override
  State<NetworkingDemo> createState() => _NetworkingDemoState();
}

class _NetworkingDemoState extends State<NetworkingDemo> {
  final manager = NetworkingManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: manager.catNotifier,
              builder: (context, catFacts, child) {
                return Text(catFacts, textAlign: TextAlign.center);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                manager.getRequest();
              },
              child: Text('GET'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                manager.postRequest();
              },
              child: Text('POST'),
            ),
          ],
        ),
      ),
    );
  }
}
