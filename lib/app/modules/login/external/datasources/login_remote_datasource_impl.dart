import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../infra/datasources/login_remote_datasource.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final IHttpClientAdapter _httpClient;
  const LoginRemoteDataSourceImpl(this._httpClient);

  @override
  Future<void> signIn() async {
    try {
      final response = await _httpClient.post('auth/sign-in',
          data: {"email": "desafio@ioasys.com.br", "password": "12341234"});
      print(response.headers['authorization']);
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
