import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class KeyboardAttachable extends StatefulWidget {
  const KeyboardAttachable({
    @required this.child,
    Key key,
  }) : super(key: key);

  final Widget child;

  @override
  _KeyboardAttachableState createState() =>
      _KeyboardAttachableState();
}

class _KeyboardAttachableState extends State<KeyboardAttachable>
    with SingleTickerProviderStateMixin {
  AnimationController _bottomSizeController;
  double _bottomSize;

  @override
  void initState() {
    _bottomSize = 0;
    _bottomSizeController = AnimationController(vsync: this);
    final spring = SpringDescription(mass: 8, stiffness: 1, damping: 4.5);
    final fwSimulation = SpringSimulation(spring, 0, 1, 10);
    final revSimulation = SpringSimulation(spring, 1, 0, -10);
    KeyboardVisibilityNotification().addNewListener(
      onShow: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _bottomSizeController.animateWith(fwSimulation);
        });
      },
      onHide: () {
        _bottomSizeController.animateWith(revSimulation);
      }
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
          sizeFactor: _bottomSizeController,
          child: SizedBox(height: _bottomSize),
        ),
      ],
    );
  }

  void _shouldUpdateBottomSize(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInsets != 0) {
      _bottomSize = bottomInsets;
    }
  }
}
