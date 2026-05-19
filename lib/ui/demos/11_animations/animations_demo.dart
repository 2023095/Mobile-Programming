import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with
        SingleTickerProviderStateMixin // needed for Explicit transition
        {
  // --- Implicit Animation ---
  bool _isExpanded = false;

  // --- Explicit Animation ---
  late AnimationController _spinController;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==========================================
            // 1. IMPLICIT ANIMATION: AnimatedContainer
            // ==========================================
            const Text(
              'Implicit Animation: AnimatedContainer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // We just change a boolean, Flutter handles the smooth transition
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutBack,
                width: _isExpanded ? 200.0 : 100.0,
                height: _isExpanded ? 150.0 : 100.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isExpanded ? Colors.teal : Colors.deepOrange,
                  borderRadius: BorderRadius.circular(_isExpanded ? 30.0 : 8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  'Tap Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const Divider(height: 50, thickness: 2),

            // ==========================================
            // 2. EXPLICIT ANIMATION: RotationTransition
            // ==========================================
            const Text(
              'Explicit Animation: RotationTransition',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // This widget listens directly to the _spinController
            RotationTransition(
              turns: _spinController,
              child: const Icon(
                Icons.settings,
                size: 100,
                color: Colors.blueGrey,
              ),
            ),

            const SizedBox(height: 20),

            // Because it's explicit, we have full control to start, stop, or reverse it
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () =>
                      _spinController.repeat(), // Loops indefinitely
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Spin'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () =>
                      _spinController.stop(), // Pauses exactly where it is
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}