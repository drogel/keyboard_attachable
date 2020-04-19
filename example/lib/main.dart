import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

void main() => runApp(Example());

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Keyboard Attachable Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: KeyboardAttachablePage(),
      );
}

/// Builds a [Scaffold] that lays out a footer at the bottom of the page.
class KeyboardAttachablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text("Keyboard Attachable demo")),
        body: FooterLayout(
          footer: KeyboardAttachableFooter(),
          child: ColorsList(),
        ),
      );
}

/// Builds a footer that animates its bottom space when the keyboard is shown.
class KeyboardAttachableFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => KeyboardAttachable(
        backgroundColor: Colors.blue,
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Tap me!",
              fillColor: Colors.white,
              filled: true,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      );
}

/// Builds a [ListView] made of colored containers that fill the page.
class ColorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
        itemExtent: 66,
        itemCount: Colors.primaries.length,
        itemBuilder: (_, i) => Container(
          color: Colors.primaries[i].withOpacity(0.2),
        ),
      );
}
