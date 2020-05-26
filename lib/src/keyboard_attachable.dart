import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_controller.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_injector.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

typedef KeyboardTransitionBuilder = Widget Function(
  Widget child,
  Animation<double> animation,
);

/// A widget that adds space below its baseline when the soft keyboard is shown
/// and hidden with an animation that matches that of the platform keyboard.
///
/// This widget can be used to animate its child when the soft keyboard is shown
/// or hidden, so that the child widget appears to be attached to the keyboard.
///
/// Even if no child widget is passed to [KeyboardAttachable], it can still be
/// used to animate the shrinkage and expansion of the layout when the keyboard
/// is shown an hidden, respectively. In order for this to work, this widget
/// has to be attached to the bottom of the page, for example, by using a
/// [FooterLayout], and the [Scaffold.resizeToAvoidBottomInset] parameter of
/// the [Scaffold] above the page has to be set to false.
class KeyboardAttachable extends StatefulWidget {
  /// Creates a widget that smoothly adds space below its child when the
  /// keyboard is shown or hidden.
  const KeyboardAttachable({
    this.child,
    this.keyboardTransitionBuilder = KeyboardAttachable._defaultBuilder,
    this.backgroundColor = Colors.transparent,
    Key key,
  })  : assert(keyboardTransitionBuilder != null),
        super(key: key);

  /// The color that fills the space that is added when the keyboard appears.
  ///
  /// By default, this value is [Colors.transparent].
  final Color backgroundColor;

  final KeyboardTransitionBuilder keyboardTransitionBuilder;

  /// The widget to be placed above the space that this widget can insert.
  final Widget child;

  @override
  _KeyboardAttachableState createState() => _KeyboardAttachableState();

  static Widget _defaultBuilder(
    Widget child,
    Animation<double> animation,
  ) =>
      child;
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
      onShow: _controller.forward,
      onHide: _controller.reverse,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animation = _controller.animation;
    final child = widget.child;
    _shouldUpdateBottomSize(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (child != null) widget.keyboardTransitionBuilder(child, animation),
        SizeTransition(
          sizeFactor: animation,
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
