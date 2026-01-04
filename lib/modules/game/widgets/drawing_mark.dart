import 'package:flutter/material.dart';
import '../../../data/models/player_model.dart';
import '../../../core/constants/app_colors.dart';

class DrawingMark extends StatefulWidget {
  final Player player;
  final double size;
  final Color color;
  final Duration duration;

  const DrawingMark({
    super.key,
    required this.player,
    required this.size,
    required this.color,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<DrawingMark> createState() => _DrawingMarkState();
}

class _DrawingMarkState extends State<DrawingMark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: _MarkPainter(
              player: widget.player,
              progress: _animation.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}

class _MarkPainter extends CustomPainter {
  final Player player;
  final double progress;
  final Color color;

  _MarkPainter({
    required this.player,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.15
      ..strokeCap = StrokeCap.round;

    if (player == Player.X) {
      _drawX(canvas, size, paint);
    } else {
      _drawO(canvas, size, paint);
    }
  }

  void _drawX(Canvas canvas, Size size, Paint paint) {
    // Top-left to bottom-right
    if (progress > 0) {
      final p1 = Offset(size.width * 0.2, size.height * 0.2);
      final p2 = Offset(size.width * 0.8, size.height * 0.8);
      
      // First stroke
      double firstStrokeProgress = (progress * 2).clamp(0.0, 1.0);
      canvas.drawLine(
        p1,
        Offset.lerp(p1, p2, firstStrokeProgress)!,
        paint,
      );

      // Top-right to bottom-left
      if (progress > 0.5) {
        final p3 = Offset(size.width * 0.8, size.height * 0.2);
        final p4 = Offset(size.width * 0.2, size.height * 0.8);
        
        // Second stroke
        double secondStrokeProgress = ((progress - 0.5) * 2).clamp(0.0, 1.0);
        canvas.drawLine(
          p3,
          Offset.lerp(p3, p4, secondStrokeProgress)!,
          paint,
        );
      }
    }
  }

  void _drawO(Canvas canvas, Size size, Paint paint) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    final rect = Rect.fromCircle(center: center, radius: radius);
    
    // Draw arc based on progress (full circle is 2 * pi)
    canvas.drawArc(rect, -1.57, 6.28 * progress, false, paint);
  }

  @override
  bool shouldRepaint(covariant _MarkPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
