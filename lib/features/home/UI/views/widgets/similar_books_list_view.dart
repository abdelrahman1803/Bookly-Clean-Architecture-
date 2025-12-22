import 'package:bookly/core/utilities/routing/routes.dart';
import 'package:bookly/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  static const _imageUrls = [
    'https://images.unsplash.com/photo-1529070538774-1843cb3265df?w=300',
    'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=300',
    'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=300',
    'https://images.unsplash.com/photo-1471109880861-75cec67f8b68?w=300',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.separated(
        itemCount: _imageUrls.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => GoRouter.of(context).push(Routes.bookDetailsView),
            child: CustomBookItem(imageUrl: _imageUrls[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 6),
      ),
    );
  }
}
