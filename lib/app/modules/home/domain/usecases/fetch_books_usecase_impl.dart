import 'package:books/app/modules/home/domain/entities/book_response_entity.dart';
import 'package:books/app/modules/home/domain/repositories/book_repository.dart';
import 'package:books/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'fetch_books_usecase.dart';

class FetchBooksUsecaseImpl implements FetchBooksUsecase {
  final BookRepository _repository;

  const FetchBooksUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, BookResponseEntity>> call({String? page}) async {
    final reponse = await _repository.fetchBooks(page: page);
    return reponse;
  }
}
