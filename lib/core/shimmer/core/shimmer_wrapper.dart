import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration period;
  final bool enabled;
  final ShimmerDirection direction;

  const ShimmerWrapper({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFF2A2A2A),
    this.highlightColor = const Color(0xFF3A3A3A),
    this.period = const Duration(milliseconds: 1200),
    this.enabled = true,
    this.direction = ShimmerDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: period,
      enabled: enabled,
      direction: direction,
      child: child,
    );
  }
}
