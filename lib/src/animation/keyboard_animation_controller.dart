import 'package:flutter/animation.dart';

abstract class KeyboardAnimationController {
  Animation<double> get animation;

  TickerFuture forward();

  TickerFuture reverse();

  void dispose();
}
