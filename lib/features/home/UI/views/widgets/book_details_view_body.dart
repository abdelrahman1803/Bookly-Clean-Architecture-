import 'package:bookly/features/home/UI/views/widgets/books_details_section.dart';
import 'package:bookly/features/home/UI/views/widgets/custom_book_deatails_app_bar.dart';
import 'package:bookly/features/home/UI/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: const [
              CustomBookDetailsAppBar(),
              BookDetailsSection(),
              SizedBox(height: 16),
              SimilarBooksSection(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
