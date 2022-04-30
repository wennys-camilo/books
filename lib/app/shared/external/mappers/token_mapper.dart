import '../../domain/entities/token_entity.dart';

class TokenMapper {
  TokenEntity from(Map<String, dynamic> map) {
    return TokenEntity(
      token: map['authorization'],
      refreshToken: map['refresh-token'],
    );
  }
}
