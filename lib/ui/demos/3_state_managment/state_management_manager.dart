import 'package:flutter/material.dart';
import 'package:flutter_demo/services/local_storage/local_storage.dart';
import 'package:flutter_demo/services/service_locator.dart';

class StateManagementManager {
  final colorNotifier = ValueNotifier<Color>(Colors.black);
  final numberNotifier = ValueNotifier<int>(1);
  final localStorage = getIt<LocalStorage>();

  int _colorIndex = 0;
  final _colors = [
    Colors.blue,
    Colors.yellow,
    Colors.teal,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.red,
  ];

  void init() {
    final color = localStorage.getColor();
    final number = localStorage.getNumber();
    colorNotifier.value = color;
    numberNotifier.value = number;
  }

  void changeColor() {
    _colorIndex++;
    _colorIndex = _colorIndex % _colors.length;
    final color = _colors[_colorIndex];
    colorNotifier.value = color;
    localStorage.setColor(color);
  }

  void changeText() {
    numberNotifier.value++;
    localStorage.setNumber(numberNotifier.value);
  }
}
