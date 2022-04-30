import 'package:dartz/dartz.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../domain/repositories/token_repository.dart';
import '../datasources/token_local_datasource.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenLocalDataSource _localDataSource;

  const TokenRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, Unit>> saveToken(String token) async {
    try {
      await _localDataSource.setToken(token);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, String?>> fetchToken() async {
    try {
      final response = await _localDataSource.fetchToken();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
