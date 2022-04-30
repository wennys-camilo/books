import 'package:dartz/dartz.dart';
import '../helpers/errors/failure.dart';

abstract class SetTokenUsecase {
  Future<Either<Failure, Unit>> call(String token);
}
