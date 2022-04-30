class HttpResponse {
  final dynamic data;
  final dynamic headers;
  final int statusCode;

  HttpResponse({
    this.data,
    this.headers,
    required this.statusCode,
  });
}
