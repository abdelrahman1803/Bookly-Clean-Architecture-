import 'package:bookly/core/utilities/services%20locator/dependency_injection.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use%20cases/fetch_similar_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SimilarBooksCubit(FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>()))
            ..fetchSimilarBooks(book.category),
      child: Scaffold(
        body: SafeArea(child: BookDetailsViewBody(book: book)),
      ),
    );
  }
}
