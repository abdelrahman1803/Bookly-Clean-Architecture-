import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPresets {
  const ShimmerPresets._();

  static const Color _darkBase = Color(0xFF2A2A2A);
  static const Color _darkHighlight = Color(0xFF3A3A3A);

  static const Color _lightBase = Color(0xFFE7E7E7);
  static const Color _lightHighlight = Color(0xFFF5F5F5);

  static ShimmerPreset mellow({bool light = false}) => ShimmerPreset(
    baseColor: light ? _lightBase : _darkBase,
    highlightColor: light ? _lightHighlight : _darkHighlight,
    period: const Duration(milliseconds: 1300),
    direction: ShimmerDirection.ltr,
  );

  static ShimmerPreset fast({bool light = false}) => ShimmerPreset(
    baseColor: light ? _lightBase : _darkBase,
    highlightColor: light ? _lightHighlight : _darkHighlight,
    period: const Duration(milliseconds: 800),
    direction: ShimmerDirection.ltr,
  );

  static ShimmerPreset reverse({bool light = false}) => ShimmerPreset(
    baseColor: light ? _lightBase : _darkBase,
    highlightColor: light ? _lightHighlight : _darkHighlight,
    period: const Duration(milliseconds: 1200),
    direction: ShimmerDirection.rtl,
  );

  static ShimmerPreset vertical({bool light = false}) => ShimmerPreset(
    baseColor: light ? _lightBase : _darkBase,
    highlightColor: light ? _lightHighlight : _darkHighlight,
    period: const Duration(milliseconds: 1200),
    direction: ShimmerDirection.ttb,
  );
}

class ShimmerPreset {
  final Color baseColor;
  final Color highlightColor;
  final Duration period;
  final ShimmerDirection direction;

  const ShimmerPreset({
    required this.baseColor,
    required this.highlightColor,
    required this.period,
    required this.direction,
  });
}
