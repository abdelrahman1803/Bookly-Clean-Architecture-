import 'package:bookly/core/errors/error_handler.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  // no needn't in this project
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    //check permissions
    return homeRepo.fetchFeaturedBooks();
  }
}
