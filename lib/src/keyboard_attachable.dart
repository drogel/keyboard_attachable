import 'package:flutter/material.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_controller.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_injector.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

/// A widget that adds space below its baseline when the soft keyboard is shown
/// and hidden with an animation that matches that of the platform keyboard.
///
/// This widget can be used to animate its child when the soft keyboard is shown
/// or hidden, so that the child widget appears to be attached to the keyboard.
///
/// If no child widget is passed to the [KeyboardAttachable], it can still be
/// used to animate the shrinkage and expansion of the layout when the keyboard
/// is shown an hidden, respectively.
class KeyboardAttachable extends StatefulWidget {
  /// Creates a widget that smoothly adds space below its child when the
  /// keyboard is shown or hidden.
  const KeyboardAttachable({
    this.child,
    this.backgroundColor = Colors.transparent,
    Key key,
  }) : super(key: key);

  /// The color that fills the space that is added when the keyboard appears.
  ///
  /// By default, this value is [Colors.transparent].
  final Color backgroundColor;

  /// The widget to be placed above the space that this widget can insert.
  final Widget child;

  @override
  _KeyboardAttachableState createState() => _KeyboardAttachableState();
}

class _KeyboardAttachableState extends State<KeyboardAttachable>
    with SingleTickerProviderStateMixin {
  KeyboardAttachableController _controller;
  double _bottomSize;

  @override
  void initState() {
    _bottomSize = 0;
    _controller = KeyboardAttachableInjector(this).getPlatformController();
    KeyboardVisibilityNotification().addNewListener(
      onShow: () => _controller.forward(),
      onHide: () => _controller.reverse(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _shouldUpdateBottomSize(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (widget.child != null) widget.child,
        SizeTransition(
          sizeFactor: _controller.animation,
          child: Container(
            height: _bottomSize,
            color: widget.backgroundColor,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _shouldUpdateBottomSize(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInsets != 0) {
      _bottomSize = bottomInsets;
    }
  }
}
