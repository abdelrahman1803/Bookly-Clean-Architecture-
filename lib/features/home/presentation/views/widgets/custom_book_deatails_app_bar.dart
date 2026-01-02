import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key, required this.book});

  final BookEntity book;

  String _bookmarkKey(BookEntity book) {
    final id = book.bookId;
    if (id.isNotEmpty) {
      return id;
    }
    return book.title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
          ValueListenableBuilder<Box<BookEntity>>(
            valueListenable: Hive.box<BookEntity>(kBookmarksBox).listenable(),
            builder: (context, box, _) {
              final key = _bookmarkKey(book);
              final isBookmarked = box.containsKey(key);

              return IconButton(
                onPressed: () async {
                  if (isBookmarked) {
                    await box.delete(key);
                  } else {
                    await box.put(key, book);
                  }
                },
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
