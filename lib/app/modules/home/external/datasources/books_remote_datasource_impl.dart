import 'package:books/app/modules/home/domain/entities/book_response_entity.dart';
import 'package:books/app/modules/home/external/mappers/book_response_mapper.dart';
import 'package:books/app/shared/external/adapters/http_client/http_client_adapter.dart';
import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../infra/datasources/books_remote_datasource.dart';

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final IHttpClientAdapter _httpClient;

  const BooksRemoteDataSourceImpl(this._httpClient);

  @override
  Future<BookResponseEntity> fetch({String? page}) async {
    try {
      final response = await _httpClient.get(
        'books',
        queryParameters: {"page": page ?? '1', "amount": "10"},
      );
      return BookReponseMapper().from(response.data);
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
