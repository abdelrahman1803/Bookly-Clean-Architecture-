import 'package:bookly/core/utilities/routing/routes.dart';
import 'package:bookly/core/utilities/widgets/custom_error_image_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  static const _imageUrls = [
    'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=400',
    'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400',
    'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=400',
    'https://images.unsplash.com/photo-1529070538774-1843cb3265df?w=400',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        itemCount: _imageUrls.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = _imageUrls[index];
          return GestureDetector(
            onTap: () => GoRouter.of(context).push(Routes.bookDetailsView),
            child: imageUrl.isNotEmpty
                ? CustomBookItem(imageUrl: imageUrl)
                : const ErrorImageWidget(),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
