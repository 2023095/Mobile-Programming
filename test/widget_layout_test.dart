import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/demos/2_widget_layout/widgets_layout_demo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widgets exist', (tester) async {
    await tester.pumpWidget(MaterialApp(home: WidgetsLayoutDemo()));

    final textWidget = find.text('Hello');
    final button = find.text('Click me');

    expect(textWidget, findsOneWidget);
    expect(button, findsNWidgets(3));
  });
}
