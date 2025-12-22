import 'package:bookly/core/utilities/styles.dart';
import 'package:bookly/features/home/UI/views/widgets/book_rating.dart';
import 'package:bookly/features/home/UI/views/widgets/books_action.dart';
import 'package:bookly/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=800';
    return Column(
      children: [
        const SizedBox(width: 200, child: CustomBookItem(imageUrl: imageUrl)),
        const SizedBox(height: 30),
        const Text(
          'The Art of Reading',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'By: Jane Doe',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 30),
        const BooksAction(),
      ],
    );
  }
}
