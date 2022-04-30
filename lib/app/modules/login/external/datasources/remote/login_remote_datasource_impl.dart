import 'package:books/app/shared/domain/entities/token_entity.dart';
import 'package:dio/dio.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../../../../shared/external/mappers/user_mapper.dart';
import '../../../domain/entities/user_reponse_entity.dart';
import '../../../infra/datasources/login_remote_datasource.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final IHttpClientAdapter _httpClient;
  const LoginRemoteDataSourceImpl(this._httpClient);

  @override
  Future<UserResponseEntity> signIn(String email, String password) async {
    try {
      final response = await _httpClient
          .post('auth/sign-in', data: {"email": email, "password": password});
      return UserResponseEntity(
        userEntity: UserMapper().from(response.data),
        tokenEntity: TokenEntity(
          token: response.headers['authorization'][0],
          refreshToken: response.headers['refresh-token'][0],
        ),
      );
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace, message: error.message);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
