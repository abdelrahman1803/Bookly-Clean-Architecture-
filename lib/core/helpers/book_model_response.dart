import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

List<BookEntity> parseBookModel(Map<String, dynamic> data) {
  final items = data['items'];
  if (items is! List) {
    return [];
  }

  final List<BookEntity> books = [];
  for (final item in items) {
    if (item is! Map<String, dynamic>) continue;

    // Ensure essential fields exist to avoid null assertions in model
    final id = item['id'];
    final volumeInfo = item['volumeInfo'];
    final title = (volumeInfo is Map<String, dynamic>)
        ? volumeInfo['title']
        : null;
    if (id == null || title == null) continue;

    books.add(BookModel.fromJson(item));
  }
  return books;
}
