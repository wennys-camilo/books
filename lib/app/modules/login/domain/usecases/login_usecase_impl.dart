import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_reponse_entity.dart';
import '../repositories/login_repository.dart';
import 'login_usecase.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _repository;
  const LoginUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, UserResponseEntity>> call(
      String email, String password) async {
    final response = await _repository.login(email, password);
    return response;
  }
}
