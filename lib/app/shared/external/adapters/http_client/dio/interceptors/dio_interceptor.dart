import 'dart:convert';
import 'package:books/app/shared/domain/usecases/fetch_token_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../errors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  final FetchTokenUsecase _fetchTokenUsecase;

  CustomInterceptors(this._fetchTokenUsecase);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final response = await _fetchTokenUsecase();
    response.fold((l) {}, (token) {
      options.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
    });

    if (options.data != null) {
      debugPrint("Payload ${json.encode(options.data)}");
    }

    handler.next(options);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    HttpClientError failure;

    if (err.response?.statusCode == 401) {
      failure = HttpClientError(
          message: err.response?.data['errors']['message'] ??
              'Ocorreu um erro na requisição com o servidor',
          requestOptions: err.requestOptions,
          statusCode: err.response?.statusCode,
          stackTrace: err.stackTrace,
          type: err.type,
          data: err.requestOptions.data,
          error: err,
          response: err.response);
    } else {
      failure = HttpClientError(
        requestOptions: err.requestOptions,
        statusCode: err.response?.statusCode,
        stackTrace: err.stackTrace,
        type: err.type,
        data: err.requestOptions.data,
        error: err,
        response: err.response,
        message: err.response?.data['errors']['message'] ??
            'Ocorreu um erro na requisição com o servidor',
      );
    }

    handler.next(failure);
  }
}
