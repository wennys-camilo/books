import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../infra/datasources/token_local_datasource.dart';

class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  final FlutterSecureStorage _localStorage;
  const TokenLocalDataSourceImpl(this._localStorage);

  @override
  Future<void> setToken(String token) async {
    try {
      await _localStorage.write(key: 'token', value: token);
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<String?> fetchToken() async {
    try {
      final response = await _localStorage.read(key: 'token');
      return response;
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
