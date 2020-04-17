import 'package:flutter/widgets.dart';

enum _Entries { body, footer }

class FooterLayout extends StatelessWidget {
  const FooterLayout({
    Key key,
    this.body,
    this.footer,
  }) : super(key: key);

  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) => CustomMultiChildLayout(
        delegate: _SectionLayoutDelegate(),
        children: <Widget>[
          if (body != null) LayoutId(id: _Entries.body, child: body),
          if (footer != null) LayoutId(id: _Entries.footer, child: footer)
        ],
      );
}

class _SectionLayoutDelegate extends MultiChildLayoutDelegate {
  _SectionLayoutDelegate();

  @override
  void performLayout(Size size) {
    var bodySize = Size.zero;
    var footerSize = Size.zero;

    var bodyOffset = Offset.zero;
    var footerOffset = Offset.zero;

    if (hasChild(_Entries.footer)) {
      footerSize = layoutChild(_Entries.footer, BoxConstraints.loose(size));
      footerOffset = Offset(0, size.height - footerSize.height);
      positionChild(_Entries.footer, footerOffset);
    }

    if (hasChild(_Entries.body)) {
      bodySize = Size(size.width, size.height - footerSize.height);
      bodyOffset = Offset.zero;
      layoutChild(_Entries.body, BoxConstraints.loose(bodySize));
      positionChild(_Entries.body, bodyOffset);
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
