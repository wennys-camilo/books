import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../errors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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
          message: err.response?.data['message'] ??
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
        message: err.response?.data['message'] ??
            'Ocorreu um erro na requisição com o servidor',
      );
    }

    handler.next(failure);
  }
}
