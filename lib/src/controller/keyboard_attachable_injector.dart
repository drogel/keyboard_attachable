import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_controller.dart';
import 'package:keyboard_attachable/src/controller/platform_controllers/android_attachable_controller.dart';
import 'package:keyboard_attachable/src/controller/platform_controllers/ios_attachable_controller.dart';

class KeyboardAttachableInjector {
  const KeyboardAttachableInjector(this._tickerProvider);

  final TickerProvider _tickerProvider;

  KeyboardAttachableController getPlatformController() {
    if (Platform.isAndroid) {
      return AndroidAttachableController(vsync: _tickerProvider);
    } else {
      return IOSAttachableController(vsync: _tickerProvider);
    }
  }
}
