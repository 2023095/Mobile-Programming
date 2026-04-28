import 'package:flutter_demo/ui/demos/7_testing/calculator_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the default answer is 0', () {
    final manager = CalculatorManager();
    final answer = manager.answerNotifier.value;
    expect(answer, 0);
  });

  test('adding two numbers gives correct answer', () {
    final manager = CalculatorManager();
    manager.add('1', '2');
    final answer = manager.answerNotifier.value;
    expect(answer, 3);
  });

  test('if the user enters a string then throw exception', () {
    final manager = CalculatorManager();
    expect(() => manager.add('abc', '2'), throwsFormatException);
  });
}
