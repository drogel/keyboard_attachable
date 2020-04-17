import 'package:flutter/animation.dart';

abstract class KeyboardAttachableController {
  Animation<double> get animation;

  TickerFuture forward();

  TickerFuture reverse();

  void dispose();
}