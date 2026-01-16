import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  final List<_FloatingShape> _shapes = [];
  final Random _random = Random();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize shapes
    for (int i = 0; i < 15; i++) {
      _shapes.add(_generateShape());
    }
    
    // Update loop
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        for (var shape in _shapes) {
          shape.update();
        }
      });
    });
  }

  _FloatingShape _generateShape() {
    return _FloatingShape(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      size: _random.nextDouble() * 100 + 40,
      opacity: _random.nextDouble() * 0.1 + 0.05,
      speedX: (_random.nextDouble() - 0.5) * 0.002,
      speedY: (_random.nextDouble() - 0.5) * 0.002,
      isCircle: _random.nextBool(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: _BackgroundPainter(
          shapes: _shapes,
          color: AppColors.playerO, // Use accent/secondary color for shapes
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _FloatingShape {
  double x;
  double y;
  double size;
  double opacity;
  double speedX;
  double speedY;
  bool isCircle;

  _FloatingShape({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speedX,
    required this.speedY,
    required this.isCircle,
  });

  void update() {
    x += speedX;
    y += speedY;

    if (x < -0.2) x = 1.2;
    if (x > 1.2) x = -0.2;
    if (y < -0.2) y = 1.2;
    if (y > 1.2) y = -0.2;
  }
}

class _BackgroundPainter extends CustomPainter {
  final List<_FloatingShape> shapes;
  final Color color;

  _BackgroundPainter({required this.shapes, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var shape in shapes) {
      paint.color = color.withValues(alpha: shape.opacity);
      final offset = Offset(shape.x * size.width, shape.y * size.height);

      if (shape.isCircle) {
        canvas.drawCircle(offset, shape.size / 2, paint);
      } else {
        // Draw X shape (roughly)
        // For simplicity, drawing rounded rects or crosses
        final rect = Rect.fromCenter(
            center: offset, width: shape.size, height: shape.size);
        canvas.drawRRect(
            RRect.fromRectAndRadius(rect, Radius.circular(shape.size / 5)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) {
    return true; // Always repaint on animation tick
  }
}
