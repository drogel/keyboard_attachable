# keyboard_attachable library documentation

## KeyboardAttachable class

A widget that adds space below its baseline when the soft keyboard is shown
and hidden with an animation that matches that of the platform keyboard.

This widget can be used to animate its child when the soft keyboard is shown
or hidden, so that the child widget appears to be attached to the keyboard.

If no child widget is passed to the `KeyboardAttachable`, it can still be
used to animate the shrinkage and expansion of the layout when the keyboard
is shown an hidden, respectively.

### Constructor

Creates a widget that smoothly adds space below its child when the
keyboard is shown or hidden.

```dart
  const KeyboardAttachable({
    this.child,
    this.backgroundColor = Colors.transparent,
    Key key,
  });
```

### Properties

#### backgroundColor (`Color`)

The color that fills the space that is added when the keyboard appears.

By default, this value is `Colors.transparent`.

#### child (`Widget`)

The widget to be placed above the space that this widget can insert.

## FooterLayout class

A widget that can lay out a child widget above a footer.

This widget builds a `CustomMultiChildLayout` whose delegate loosely
positions a footer widget at the bottom of the available space first,
and then positions its child widget in the remaining space with loose
constraints.

### Constructor

Creates a layout with its child widget above a footer widget.


```dart
  const FooterLayout({
    Key key,
    this.footer,
    this.child,
  });
```

### Properties

#### footer (`Widget`)

The widget to position at the bottom of the available space.

#### child (`Widget`)

The primary content of the `FooterLayout`.