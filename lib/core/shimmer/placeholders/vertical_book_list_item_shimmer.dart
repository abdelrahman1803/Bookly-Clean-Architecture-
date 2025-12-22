import 'package:bookly/core/shimmer/placeholders/book_cover_shimmer.dart';
import 'package:bookly/core/shimmer/placeholders/text_block_shimmer.dart';
import 'package:flutter/material.dart';

class VerticalBookListItemShimmer extends StatelessWidget {
  const VerticalBookListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        BookCoverShimmer(width: 85, height: 120),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBlockShimmer(width: 160, height: 14),
              SizedBox(height: 8),
              TextBlockShimmer(width: 120, height: 12),
              SizedBox(height: 12),
              Row(
                children: [
                  TextBlockShimmer(width: 60, height: 12),
                  SizedBox(width: 8),
                  TextBlockShimmer(width: 40, height: 12),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
