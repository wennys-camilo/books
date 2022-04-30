import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_reponse_entity.dart';

abstract class LoginUsecase {
  Future<Either<Failure, UserResponseEntity>> call(
      String email, String password);
}
