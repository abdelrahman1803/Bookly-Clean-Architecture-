
import 'package:bookly/core/shimmer/core/shimmer_container.dart';
import 'package:bookly/core/shimmer/placeholders/book_cover_shimmer.dart';
import 'package:bookly/core/shimmer/placeholders/text_block_shimmer.dart';
import 'package:flutter/material.dart';

class BookDetailsShimmer extends StatelessWidget {
  const BookDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ShimmerContainer(
                width: 32,
                height: 32,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              ShimmerContainer(
                width: 32,
                height: 32,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BookCoverShimmer(width: width * 0.4, height: width * 0.55),
          const SizedBox(height: 16),
          const TextBlockShimmer(width: 220, height: 16),
          const SizedBox(height: 8),
          const TextBlockShimmer(width: 140, height: 14),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ShimmerContainer(
                width: 120,
                height: 40,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              SizedBox(width: 12),
              ShimmerContainer(
                width: 120,
                height: 40,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const TextBlockShimmer(width: 160, height: 14),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, _) =>
                  const BookCoverShimmer(width: 85, height: 120),
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
