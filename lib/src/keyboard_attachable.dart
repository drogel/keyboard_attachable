import 'package:flutter/material.dart';
import 'package:keyboard_attachable/src/android_attachable_controller.dart';
import 'package:keyboard_attachable/src/keyboard_attachable_controller.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class KeyboardAttachable extends StatefulWidget {
  const KeyboardAttachable({
    @required this.child,
    this.backgroundColor = Colors.transparent,
    Key key,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;

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
    _controller = AndroidAttachableController(vsync: this);
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
