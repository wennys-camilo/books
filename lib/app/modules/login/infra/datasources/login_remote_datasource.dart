import '../../domain/entities/user_reponse_entity.dart';

abstract class LoginRemoteDataSource {
  Future<UserResponseEntity> signIn(String email, String password);
}
