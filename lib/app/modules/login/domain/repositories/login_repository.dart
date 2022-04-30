import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_reponse_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserResponseEntity>> login(
      String email, String password);
}
