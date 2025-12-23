import 'package:bookly/constants.dart';
import 'package:bookly/core/utilities/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kPaddingSH16,
          child: Text(
            "You may also like",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: 16),
        const SimilarBooksListView(),
      ],
    );
  }
}
