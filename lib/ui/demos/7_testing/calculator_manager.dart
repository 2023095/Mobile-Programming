import 'package:flutter/material.dart';

class CalculatorManager {
  final answerNotifier = ValueNotifier<double>(0);

  void add(String first, String second) {
    final firstNumber = double.parse(first);
    final secondNumber = double.parse(second);
    answerNotifier.value = firstNumber + secondNumber;
  }
}
