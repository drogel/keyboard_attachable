import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/physics.dart';
import 'package:keyboard_attachable/src/animation/keyboard_animation_controller.dart';

class IOSKeyboardAnimationController implements KeyboardAnimationController {
  IOSKeyboardAnimationController({required TickerProvider vsync})
      : _controller = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 250),
        );

  AnimationController _controller;

  // Calculated based on spring interpolation from https://github.com/CosynPa/RevealSpringAnimation
// @override
  Animation<double> get animation => TweenSequence<double>(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.0, end: 0.0378945710726348)
                .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.0378945710726348, end: 0.124734869398615)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.124734869398615, end: 0.177165077399258)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.1771650773992585, end: 0.232230492534301)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.232230492534301, end: 0.288142884918677)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.288142884918677, end: 0.343566301349425)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.343566301349425, end: 0.397525020517165)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.397525020517165, end: 0.449328480839688)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.449328480839688, end: 0.498510223492776)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.544778389928067, end: 0.587975728583874)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.628047412666313, end: 0.665015260793732)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.698957194203488, end: 0.729990965893388)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.758261365048704, end: 0.783930239883246)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.807168798214102, end: 0.828151741567624)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.847052868629256, end: 0.864041850126972)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.879281932061502, end: 0.89292836947895)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.905127430324033, end: 0.91601583965413)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.925720559754988, end: 0.934358822413164)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.942038346548186, end: 0.94885768823959)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.954906681442232, end: 0.960266936818686)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.965012373505042, end: 0.969209764577412)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.972919281759302, end: 0.97619502871874)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.979085555325651, end: 0.981634347620896)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.983880290109166, end: 0.985858098428022)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.987598721546455, end: 0.989129713475411)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.99047557508464, end: 0.991658067059749)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.992696495336988, end: 0.993607970550618)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.994407643142672, end: 0.995108915836915)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.995723635183195, end: 0.996262263847681)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.996734035268435, end: 0.997147092222164)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.997508610762945, end: 0.997824910901819)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.99810155530117, end: 0.998343437162298)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween:
                Tween<double>(begin: 0.998554858390709, end: 0.998739599032797)
                    .chain(CurveTween(curve: Curves.linear)),
            weight: 10,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.998900978890739, end: 1)
                .chain(CurveTween(curve: Curves.linear)),
            weight: 10.0,
          ),
        ],
      ).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0, 1.0)));

  @override
  void dispose() => _controller.dispose();

  @override
  TickerFuture forward() => _controller.forward();

  @override
  TickerFuture reverse() => _controller.reverse();
}
