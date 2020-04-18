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
            body: ListView.builder(
              itemCount: Colors.primaries.length,
              itemBuilder: (_, i) => Container(
                height: 88,
                color: Colors.primaries[i].withOpacity(0.33),
              ),
            ),
            footer: KeyboardAttachable(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tap me!",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
