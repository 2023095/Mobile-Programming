import 'package:flutter/material.dart';

class DartDemoScreen extends StatelessWidget {
  const DartDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1. Dart Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Center aligns the scroll view in the middle of the screen
      body: Center(
        // SingleChildScrollView ensures the content scrolls if the screen is too small
        child: SingleChildScrollView(
          child: Column(
            // MainAxisSize.min ensures the column only takes up needed space
            // so the Center widget can do its job vertically
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('Hello, World!');
                },
                child: const Text("Hello World"),
              ),
              const SizedBox(height: 10), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  var name = 'Voyager I';
                  var year = 1977;
                  var antennaDiameter = 3.7;
                  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
                  var image = {
                    'tags': ['saturn'],
                    'url': '//path/to/saturn.jpg',
                  };
                  print(year);
                  print(name);
                  print(antennaDiameter);
                  print(flybyObjects);
                  print(image);
                },
                child: const Text("Variables"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var year = 1977;
                  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

                  if (year >= 2001) {
                    print('21st century');
                  } else if (year >= 1901) {
                    print('20th century');
                  }

                  for (final object in flybyObjects) {
                    print(object);
                  }

                  for (int month = 1; month <= 12; month++) {
                    print(month);
                  }

                  while (year < 2016) {
                    year += 1;
                  }
                },
                child: const Text("Control Flow"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  int fibonacci(int n) {
                    if (n == 0 || n == 1) return n;
                    return fibonacci(n - 1) + fibonacci(n - 2);
                  }

                  var result = fibonacci(10);
                  print(result);
                },
                child: const Text("Functions"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
