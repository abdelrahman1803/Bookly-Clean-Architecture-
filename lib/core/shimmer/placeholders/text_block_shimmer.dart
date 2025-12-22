import 'package:bookly/core/shimmer/core/shimmer_container.dart';
import 'package:flutter/material.dart';

class TextBlockShimmer extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  const TextBlockShimmer({
    super.key,
    required this.width,
    this.height = 12,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ShimmerContainer(
        width: width,
        height: height,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
