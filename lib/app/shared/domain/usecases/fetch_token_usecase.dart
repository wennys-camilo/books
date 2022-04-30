import 'package:books/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FetchTokenUsecase {
  Future<Either<Failure, String?>> call();
}
