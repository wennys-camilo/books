import 'package:dartz/dartz.dart';
import '../helpers/errors/failure.dart';

abstract class TokenRepository {
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, String?>> fetchToken();
}
