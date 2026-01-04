import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/audio_service.dart';

class AnimatedScaleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Duration duration;
  final double tapScale;
  final double hoverScale;

  const AnimatedScaleButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.duration = const Duration(milliseconds: 100),
    this.tapScale = 0.95,
    this.hoverScale = 1.05,
  });

  @override
  State<AnimatedScaleButton> createState() => _AnimatedScaleButtonState();
}

class _AnimatedScaleButtonState extends State<AnimatedScaleButton>
    with TickerProviderStateMixin {
  late AnimationController _tapController;
  late Animation<double> _tapAnimation;
  
  late AnimationController _hoverController;
  late Animation<double> _hoverAnimation;

  @override
  void initState() {
    super.initState();
    // Tap Animation (Shrink)
    _tapController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _tapAnimation = Tween<double>(begin: 1.0, end: widget.tapScale).animate(
      CurvedAnimation(parent: _tapController, curve: Curves.easeInOut),
    );

    // Hover Animation (Grow)
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _hoverAnimation = Tween<double>(begin: 1.0, end: widget.hoverScale).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _tapController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _tapController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _tapController.reverse();
    try {
      Get.find<AudioService>().playClick();
    } catch (_) {}
    widget.onPressed();
  }

  void _onTapCancel() {
    _tapController.reverse();
  }
  
  void _onHoverEnter(PointerEvent details) {
    _hoverController.forward();
  }

  void _onHoverExit(PointerEvent details) {
    _hoverController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onHoverEnter,
      onExit: _onHoverExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: ScaleTransition(
          scale: _hoverAnimation,
          child: ScaleTransition(
            scale: _tapAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
