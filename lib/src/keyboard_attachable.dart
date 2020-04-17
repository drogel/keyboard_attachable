import 'package:flutter/material.dart';
import 'package:keyboard_attachable/src/cupertino_attachable_controller.dart';
import 'package:keyboard_attachable/src/keyboard_attachable_controller.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class KeyboardAttachable extends StatefulWidget {
  const KeyboardAttachable({
    @required this.child,
    Key key,
  }) : super(key: key);

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
    _controller = CupertinoAttachableController(vsync: this);
    KeyboardVisibilityNotification().addNewListener(
      onShow: () => WidgetsBinding.instance.addPostFrameCallback(
        (_) => _controller.forward(),
      ),
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
          child: SizedBox(height: _bottomSize),
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
