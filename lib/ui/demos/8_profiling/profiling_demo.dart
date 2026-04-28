import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ProfilingDemo extends StatefulWidget {
  const ProfilingDemo({super.key});

  @override
  State<ProfilingDemo> createState() => _ProfilingDemoState();
}

class _ProfilingDemoState extends State<ProfilingDemo> {
  // Used for memory leak demonstration
  final List<String> _heavyList = [];
  String _networkResponse = "No request made yet.";

  // 1. PERFORMANCE / CPU DEMO (Intentional Jank)
  void _causeJank() {
    developer.log('Starting heavy computation...', name: 'DemoApp');

    // Using Timeline to show custom events in the Performance tab
    developer.Timeline.timeSync('FibonacciComputation', () {
      // Calculates Fibonacci(42) synchronously, which will freeze the UI thread
      int fibonacci(int n) {
        if (n <= 1) return n;
        return fibonacci(n - 1) + fibonacci(n - 2);
      }

      final result = fibonacci(42);
      debugPrint('Result: $result');
    });

    developer.log('Heavy computation finished.', name: 'DemoApp');
  }

  // 2. MEMORY DEMO (Allocating massive objects)
  void _allocateMemory() {
    setState(() {
      for (int i = 0; i < 500000; i++) {
        _heavyList.add(
          "This is a relatively long string designed to take up heap memory. ID: $i",
        );
      }
    });
    developer.log('Allocated 500,000 strings.', name: 'DemoApp');
  }

  void _clearMemory() {
    setState(() {
      _heavyList.clear();
    });
    developer.log('Memory cleared.', name: 'DemoApp');
  }

  // 3. NETWORK DEMO
  Future<void> _makeNetworkRequest() async {
    setState(() => _networkResponse = "Fetching...");

    try {
      final client = HttpClient();
      final request = await client.getUrl(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );
      final response = await request.close();

      final responseBody = await response.transform(utf8.decoder).join();
      setState(() {
        _networkResponse = "Success! Check Network Tab.";
      });
      debugPrint(responseBody);
    } catch (e) {
      setState(() => _networkResponse = "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter DevTools Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Visual indicator to show when the UI thread is frozen
            //const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 20),

            _buildSectionHeader('1. Flutter Inspector'),
            const Text(
              'Use the "Select Widget" tool to inspect the overflowing row below. Change its color directly from DevTools!',
            ),
            const SizedBox(height: 8),
            // Intentional Layout Issue (Overflow)
            Container(
              color: Colors.grey[300],
              height: 50,
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange),
                  Text(
                    'This row is going to overflow the screen because it is way too wide for a standard mobile device.',
                    style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),

            _buildSectionHeader('2. Performance / CPU Profiler'),
            const Text(
              'Notice the spinning indicator above. Click this button to run a heavy synchronous task. The UI will freeze (jank), and it will show up as a red bar in DevTools.',
            ),
            ElevatedButton(
              onPressed: _causeJank,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Cause UI Jank (Calculate Fib(42))'),
            ),
            const Divider(height: 40),

            _buildSectionHeader('3. Memory'),
            const Text(
              'Watch the memory graph spike. You can take a snapshot, clear the memory, and click "Force GC" in DevTools to watch it drop.',
            ),
            Text(
              'Current List Size: ${_heavyList.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _allocateMemory,
                    child: const Text('Allocate Memory'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clearMemory,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text('Clear Memory'),
                  ),
                ),
              ],
            ),
            const Divider(height: 40),

            _buildSectionHeader('4. Network & Logging'),
            const Text(
              'Click to make an HTTP request. Inspect the Headers and JSON payload in the Network tab. Check the Logging tab for custom logs.',
            ),
            ElevatedButton(
              onPressed: _makeNetworkRequest,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Make HTTP Request'),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: $_networkResponse',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
