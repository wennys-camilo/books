import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/book_response_entity.dart';

abstract class FetchBooksUsecase {
  Future<Either<Failure, BookResponseEntity>> call({String? page});
}
