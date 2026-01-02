import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  Future<void> saveSearchedBook(BookEntity book);
  List<BookEntity> fetchSearchedBooks();
  Future<void> clearSearchHistory();
  Future<void> removeBookFromHistory(BookEntity book);
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  final Box<BookEntity> box = Hive.box<BookEntity>(kSearchHistoryBox);

  bool _matches(BookEntity a, BookEntity b) {
    if (a.bookId.isNotEmpty && b.bookId.isNotEmpty) {
      return a.bookId == b.bookId;
    }
    return a.title == b.title;
  }

  @override
  Future<void> saveSearchedBook(BookEntity book) async {
    final exists = box.values.any((b) => b.bookId == book.bookId);
    if (!exists) {
      await box.add(book);
    }

    while (box.length > 20) {
      await box.deleteAt(0);
    }
  }

  @override
  List<BookEntity> fetchSearchedBooks() {
    return box.values.toList().reversed.toList();
  }

  @override
  Future<void> clearSearchHistory() async {
    await box.clear();
  }

  @override
  Future<void> removeBookFromHistory(BookEntity book) async {
    for (int i = box.length - 1; i >= 0; i--) {
      final existing = box.getAt(i);
      if (existing != null && _matches(existing, book)) {
        await box.deleteAt(i);
      }
    }
  }
}
