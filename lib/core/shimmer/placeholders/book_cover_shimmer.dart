import 'package:bookly/core/shimmer/core/shimmer_container.dart';
import 'package:flutter/material.dart';

class BookCoverShimmer extends StatelessWidget {
  final double width;
  final double height;

  const BookCoverShimmer({super.key, this.width = 85, this.height = 120});

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
