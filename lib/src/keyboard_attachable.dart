import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_controller.dart';
import 'package:keyboard_attachable/src/controller/keyboard_attachable_injector.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

/// Signature for builders used in custom transitions for KeyboardAttachable.
///
/// The function should return a widget which wraps the given [child].
/// It may also use the animation to inform its transition.
typedef KeyboardTransitionBuilder = Widget Function(
  Widget child,
  Animation<double> animation,
  double keyboardHeight,
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
    this.transitionBuilder = KeyboardAttachable._defaultBuilder,
    this.backgroundColor = Colors.transparent,
    Key key,
  })  : assert(transitionBuilder != null),
        super(key: key);

  /// The color that fills the space that is added when the keyboard appears.
  ///
  /// Defaults to [Colors.transparent].
  final Color backgroundColor;

  /// A function that wraps a new child with an animation that makes the
  /// keyboard appear when the animation runs in the forward direction and hide
  /// when the animation runs in the reverse direction.
  ///
  /// This is only called when the keyboard changes its status from hidden to
  /// shown.
  ///
  /// Defaults to [KeyboardAttachable._defaultBuilder], which simply returns
  /// the child that was passed to [KeyboardAttachable].
  ///
  /// The animation provided to the builder has the duration and curve needed
  /// to make the keyboard animation match the corresponding platform animation.
  /// The animation value will be 0 if the keyboard is dismissed, and 1 if the
  /// keyboard is fully shown.
  ///
  /// See also:
  ///
  /// * [KeyboardTransitionBuilder] for more information about how a transition
  /// builder should function.
  final KeyboardTransitionBuilder transitionBuilder;

  /// The widget to be placed above the space that this widget can insert.
  final Widget child;

  @override
  _KeyboardAttachableState createState() => _KeyboardAttachableState();

  static Widget _defaultBuilder(
    Widget child,
    Animation<double> animation,
    double keyboardHeight,
  ) =>
      child;
}

class _KeyboardAttachableState extends State<KeyboardAttachable>
    with SingleTickerProviderStateMixin {
  KeyboardAttachableController _controller;
  double _bottomInset;

  @override
  void initState() {
    _bottomInset = 0;
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
        if (child != null)
          widget.transitionBuilder(child, animation, _bottomInset),
        SizeTransition(
          sizeFactor: animation,
          child: Container(
            height: _bottomInset,
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
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInset != 0) {
      _bottomInset = bottomInset;
    }
  }
}
