import '../../domain/entities/book_response_entity.dart';

abstract class BooksRemoteDataSource {
  Future<BookResponseEntity> fetch({String? page});
}
