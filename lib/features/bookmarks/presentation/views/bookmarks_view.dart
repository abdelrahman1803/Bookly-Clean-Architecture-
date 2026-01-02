import 'package:bookly/constants.dart';
import 'package:bookly/core/utilities/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(width: 8),
                  const Text('Bookmarks', style: Styles.textStyle20),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder<Box<BookEntity>>(
                  valueListenable: Hive.box<BookEntity>(
                    kBookmarksBox,
                  ).listenable(),
                  builder: (context, box, _) {
                    final books = box.values.toList().reversed.toList();
                    if (books.isEmpty) {
                      return const Center(
                        child: Text(
                          'No bookmarks yet',
                          style: Styles.textStyle16,
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: BookListViewItem(book: books[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
