// ignore_for_file: unnecessary_underscores

import 'package:bookly/core/shimmer/placeholders/vertical_book_list_item_shimmer.dart';
import 'package:flutter/material.dart';

class SearchResultListShimmer extends StatelessWidget {
  const SearchResultListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 8,
      itemBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: VerticalBookListItemShimmer(),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 0),
    );
  }
}
