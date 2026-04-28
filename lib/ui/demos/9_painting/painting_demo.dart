import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaintingDemo extends StatefulWidget {
  const PaintingDemo({super.key});

  @override
  State<PaintingDemo> createState() => _PaintingDemoState();
}

class _PaintingDemoState extends State<PaintingDemo> {
  double _control1x = 30.0;
  double _control1y = 150.0;
  double _control2x = 270.0;
  double _control2y = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  _buildSlider(
                    label: 'Control 1 X',
                    value: _control1x,
                    onChanged: (value) => setState(() => _control1x = value),
                  ),
                  _buildSlider(
                    label: 'Control 1 Y',
                    value: _control1y,
                    onChanged: (value) => setState(() => _control1y = value),
                  ),
                  _buildSlider(
                    label: 'Control 2 X',
                    value: _control2x,
                    onChanged: (value) => setState(() => _control2x = value),
                  ),
                  _buildSlider(
                    label: 'Control 2 Y',
                    value: _control2y,
                    onChanged: (value) => setState(() => _control2y = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: MyPainter(
                    control1: Offset(_control1x, _control1y),
                    control2: Offset(_control2x, _control2y),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toStringAsFixed(0)}'),
        Slider(
          value: value,
          min: 0,
          max: 300,
          divisions: 300,
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({
    required this.control1,
    required this.control2,
  });

  final Offset control1;
  final Offset control2;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(50, 50)
      ..cubicTo(control1.dx, control1.dy, control2.dx, control2.dy, 240, 150);

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawPath(path, paint);

    final debugPaint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(control1, 6.0, debugPaint);
    canvas.drawCircle(control2, 6.0, debugPaint);
  }

  @override
  bool shouldRepaint(covariant MyPainter old) {
    return old.control1 != control1 || old.control2 != control2;
  }
}

class ProgressBar extends LeafRenderObjectWidget {
  const ProgressBar({
    super.key,
    required this.barColor,
    required this.thumbColor,
    this.thumbSize = 20.0,
  });

  final Color barColor;
  final Color thumbColor;
  final double thumbSize;

  @override
  RenderProgressBar createRenderObject(BuildContext context) {
    return RenderProgressBar(
      barColor: barColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderProgressBar renderObject,
  ) {
    renderObject
      ..barColor = barColor
      ..thumbColor = thumbColor
      ..thumbSize = thumbSize;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('barColor', barColor));
    properties.add(ColorProperty('thumbColor', thumbColor));
    properties.add(DoubleProperty('thumbSize', thumbSize));
  }
}

class RenderProgressBar extends RenderBox {
  RenderProgressBar({
    required Color barColor,
    required Color thumbColor,
    required double thumbSize,
  }) : _barColor = barColor,
       _thumbColor = thumbColor,
       _thumbSize = thumbSize {
    // initialize the gesture recognizer
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        _updateThumbPosition(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateThumbPosition(details.localPosition);
      };
  }

  void _updateThumbPosition(Offset localPosition) {
    var dx = localPosition.dx.clamp(0, size.width);
    _currentThumbValue = dx / size.width;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  Color get barColor => _barColor;
  Color _barColor;
  set barColor(Color value) {
    if (_barColor == value) return;
    _barColor = value;
    markNeedsPaint();
  }

  Color get thumbColor => _thumbColor;
  Color _thumbColor;
  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  double get thumbSize => _thumbSize;
  double _thumbSize;
  set thumbSize(double value) {
    if (_thumbSize == value) return;
    _thumbSize = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = thumbSize;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  static const _minDesiredWidth = 100.0;

  @override
  double computeMinIntrinsicWidth(double height) => _minDesiredWidth;

  @override
  double computeMaxIntrinsicWidth(double height) => _minDesiredWidth;

  @override
  double computeMinIntrinsicHeight(double width) => thumbSize;

  @override
  double computeMaxIntrinsicHeight(double width) => thumbSize;

  double _currentThumbValue = 0.5;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    // paint bar
    final barPaint = Paint()
      ..color = barColor
      ..strokeWidth = 5;
    final point1 = Offset(0, size.height / 2);
    final point2 = Offset(size.width, size.height / 2);
    canvas.drawLine(point1, point2, barPaint);

    // paint thumb
    final thumbPaint = Paint()..color = thumbColor;
    final thumbDx = _currentThumbValue * size.width;
    final center = Offset(thumbDx, size.height / 2);
    canvas.drawCircle(center, thumbSize / 2, thumbPaint);
    canvas.restore();
  }

  late HorizontalDragGestureRecognizer _drag;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _drag.addPointer(event);
    }
  }
}
