import 'package:flutter/widgets.dart';

/// A widget that can lay out a child widget above a footer.
///
/// This widget builds a [CustomMultiChildLayout] whose delegate loosely
/// positions a footer widget at the bottom of the available space first,
/// and then positions a child widget in the remaining space with loose
/// constraints.
class FooterLayout extends StatelessWidget {
  /// Creates a layout with its child widget above a footer widget.
  const FooterLayout({
    Key? key,
    this.footer,
    this.child,
  }) : super(key: key);

  /// The widget to position at the bottom of the available space.
  final Widget? footer;

  /// The primary content of the [FooterLayout].
  final Widget? child;

  @override
  Widget build(BuildContext context) => CustomMultiChildLayout(
        delegate: _FooterLayoutDelegate(),
        children: <Widget>[
          if (child != null) LayoutId(id: _Entries.body, child: child!),
          if (footer != null) LayoutId(id: _Entries.footer, child: footer!)
        ],
      );
}

enum _Entries { body, footer }

class _FooterLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    var footerSize = Size.zero;

    if (hasChild(_Entries.footer)) {
      footerSize = layoutChild(_Entries.footer, BoxConstraints.loose(size));
      final footerOffset = Offset(0, size.height - footerSize.height);
      positionChild(_Entries.footer, footerOffset);
    }

    if (hasChild(_Entries.body)) {
      final bodySize = Size(size.width, size.height - footerSize.height);
      layoutChild(_Entries.body, BoxConstraints.loose(bodySize));
      positionChild(_Entries.body, Offset.zero);
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
