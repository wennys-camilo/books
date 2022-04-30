import 'package:books/app/shared/domain/entities/token_entity.dart';
import 'package:books/app/shared/domain/entities/user_entity.dart';

class UserResponseEntity {
  final UserEntity userEntity;
  final TokenEntity tokenEntity;
  UserResponseEntity({
    required this.userEntity,
    required this.tokenEntity,
  });
}
