import 'package:bookly/features/home/UI/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class LatestBooksListView extends StatelessWidget {
  const LatestBooksListView({super.key});

  static const _items = [
    {
      'title': 'Designing Interfaces',
      'author': 'Jenifer Tidwell',
      'price': 'Free',
      'image':
          'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=400',
    },
    {
      'title': 'Patterns of UI',
      'author': 'Alex Drew',
      'price': '24.99',
      'image':
          'https://images.unsplash.com/photo-1471109880861-75cec67f8b68?w=400',
    },
    {
      'title': 'Motion and Microcopy',
      'author': 'Chris Lee',
      'price': '25.00',
      'image':
          'https://images.unsplash.com/photo-1455884981818-54cb785db6fc?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: BookListViewItem(
            title: item['title']!,
            author: item['author']!,
            priceText: item['price']!,
            imageUrl: item['image']!,
          ),
        );
      },
    );
  }
}
