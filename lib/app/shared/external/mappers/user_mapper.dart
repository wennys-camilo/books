import '../../domain/entities/user_entity.dart';

class UserMapper {
  UserEntity from(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      birthdate: map['birthdate'] ?? '',
      gender: map['gender'] ?? '',
      id: map['id'] ?? '',
    );
  }
}
