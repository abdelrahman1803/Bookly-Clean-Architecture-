import 'package:bookly/core/shimmer/core/shimmer_container.dart';
import 'package:flutter/material.dart';

class FeaturedListItemShimmer extends StatelessWidget {
  const FeaturedListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: const AspectRatio(
        aspectRatio: 0.7,
        child: ShimmerContainer(
          width: double.infinity,
          height: double.infinity,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
