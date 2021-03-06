import 'package:flutter/widgets.dart';
import 'package:keyboard_attachable/src/animation/keyboard_animation_controller.dart';

class AndroidKeyboardAnimationController
    implements KeyboardAnimationController {
  AndroidKeyboardAnimationController({required TickerProvider vsync})
      : _controller = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 100),
        );

  final AnimationController _controller;

  @override
  Animation<double> get animation => CurvedAnimation(
        parent: _controller,
        curve: const Cubic(0, 0, 0.2, 1),
        reverseCurve: const Cubic(0, 0, 1, 0.2),
      );

  @override
  void dispose() => _controller.dispose();

  @override
  TickerFuture forward() => _controller.forward();

  @override
  TickerFuture reverse() => _controller.reverse();
}
