# keyboard_attachable library documentation

## KeyboardAttachable class

A widget that adds space below its baseline when the soft keyboard is shown
and hidden with an animation that matches that of the platform keyboard.

This widget can be used to animate its child when the soft keyboard is shown
or hidden, so that the child widget appears to be attached to the keyboard.

Even if no child widget is passed to `KeyboardAttachable`, it can still be
used to animate the shrinkage and expansion of the layout when the keyboard
is shown an hidden, respectively. In order for this to work, this widget
has to be attached to the bottom of the page, for example, by using a
`FooterLayout`, and the `Scaffold.resizeToAvoidBottomInset` parameter of
the `Scaffold` above the page has to be set to false.

In addition to that, when there are `SafeArea`s involved the layout, it is
recommended to set their `SafeArea.maintainBottomViewPadding` property to
true in order for the animations to run smoothly.

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

### transitionBuilder (`KeyboardTransitionBuilder`)

A function that wraps a new child with an animation that makes the
keyboard appear when the animation runs in the forward direction and hide
when the animation runs in the reverse direction.

This is only called when the keyboard changes its status from hidden to
shown (not for each build).

The default is `KeyboardAttachable._defaultBuilder`, which simply returns
the child that was passed to `KeyboardAttachable`.

The animation provided to the builder has the duration and curve applied
to make the keyboard animation match the corresponding platform animation.

See also:

* `KeyboardTransitionBuilder` for more information about how a transition
builder should function.

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

## KeyboardTransitionBuilder typedef

Signature for builders used in custom transitions for KeyboardAttachable.

The function should return a widget which wraps the given `child`.
It may also use the animation to inform its transition.

### Implementation

```dart
typedef KeyboardTransitionBuilder = Widget Function(
  Widget child,
  Animation<double> animation,
  double keyboardHeight,
);
```
