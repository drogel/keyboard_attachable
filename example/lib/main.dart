import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

void main() => runApp(Example());

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: FooterLayout(
            body: TextField(),
            footer: KeyboardAttachable(
              child: Text("Testing a label"),
            ),
          ),
        ),
      );
}
