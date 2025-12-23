import 'package:bookly/constants.dart';
import 'package:bookly/core/utilities/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/latest_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: kPaddingSH16, child: CustomAppBar()),
              const FeaturedBooksListView(),
              const SizedBox(height: 36),
              Padding(
                padding: kPaddingSH16,
                child: Text(
                  "Latest Books",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(padding: kPaddingSH16, child: LatestBooksListView()),
        ),
      ],
    );
  }
}
