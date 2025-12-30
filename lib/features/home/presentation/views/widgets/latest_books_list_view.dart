import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class LatestBooksListView extends StatelessWidget {
  const LatestBooksListView(this.books, {super.key});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final item = books[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: BookListViewItem(
            title: item.title,
            author: item.authorName!,
            priceText: books[index].price == 0
                ? 'Free'
                : books[index].price.toString(),
            imageUrl: books[index].image!,
          ),
        );
      },
    );
  }
}
