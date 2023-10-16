import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EffectFactory {
  static const int sec = 2;
  static const int small = 1;
  static List<Effect<dynamic>> leftToRightAnimate = <Effect>[
    const FadeEffect(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
    ),
    const SlideEffect(
      begin: Offset(-1.0, 0.0), // Start from the left
      end: Offset(0.0, 0.0), // Move to the right
      curve: Curves.easeOutSine,
      duration: Duration(seconds: sec),
    ),
  ];
  static List<Effect<dynamic>> rightToLeftAnimate = <Effect>[
    const FadeEffect(
      duration: Duration(seconds: sec),
      curve: Curves.easeInOutCubic,
    ),
    const SlideEffect(
      begin: Offset(1.0, 0.0), // Start from the right
      end: Offset(0.0, 0.0), // Move to the left
      curve: Curves.easeOutSine,
      duration: Duration(seconds: sec),
    ),
  ];
  static List<Effect<dynamic>> zoomOut = <Effect>[
    const FadeEffect(
      duration: Duration(seconds: sec),
      curve: Curves.easeInOutCubic,
    ),
    const SlideEffect(
      begin: Offset(1.0, 0.0), // Start from the right
      end: Offset(0.0, 0.0), // Move to the left
      curve: Curves.easeOutSine,
      duration: Duration(seconds: sec),
    ),
    const ScaleEffect(
      begin: Offset(0.8, 0.2), // Initial scale
      end: Offset(1.0, 1.0), // Zoom out to full size
      curve: Curves.easeOutSine,
      duration: Duration(seconds: sec),
    ),
  ];
  static List<Effect<dynamic>> upToDownAnimate = <Effect>[
    const FadeEffect(
      duration: Duration(seconds: small),
      curve: Curves.easeInOutCubic,
    ),
    const SlideEffect(
      begin: Offset(0.0, -1.0), // Start from the top
      end: Offset(0.0, 0.0), // Move to the center
      curve: Curves.easeOutSine,
      duration: Duration(seconds: small),
    ),
    const ScaleEffect(
      begin: Offset(0.8, 0.8), // Initial scale
      end: Offset(1.0, 1.0), // Zoom out to full size
      curve: Curves.easeOutSine,
      duration: Duration(seconds: small),
    ),
  ];
}
