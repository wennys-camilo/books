import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/user_reponse_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remoteDataSource;

  const LoginRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserResponseEntity>> login(
      String email, String password) async {
    try {
      final response = await _remoteDataSource.signIn(email, password);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
