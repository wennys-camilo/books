import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/book_response_entity.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/books_remote_datasource.dart';

class BookRepositoryImpl implements BookRepository {
  final BooksRemoteDataSource _remoteDataSource;

  const BookRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, BookResponseEntity>> fetchBooks({String? page}) async {
    try {
      final response = await _remoteDataSource.fetch(page: page);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
