import 'package:flutter/material.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_controller.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_injector.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

/// A widget that smoothly adds space below its child when the keyboard appears.
///
/// This widget can be used to animate its child when the soft keyboard is shown
/// or hidden, so that the child widget appears to be attached to the keyboard.
class KeyboardAttachable extends StatefulWidget {
  /// Creates a widget that smoothly adds space below its child when the
  /// keyboard is shown or hidden.
  ///
  /// Its child widget cannot be null.
  const KeyboardAttachable({
    @required this.child,
    this.backgroundColor = Colors.transparent,
    Key key,
  })  : assert(child != null),
        super(key: key);

  final Color backgroundColor;
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
        widget.child,
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
