import 'package:books/app/shared/domain/usecases/fetch_token_usecase_impl.dart';
import 'package:books/app/shared/domain/usecases/set_token_usecase_impl.dart';
import 'package:books/app/shared/infra/repositories/token_repository_impl.dart';
import 'package:books/app/shared/internal/local/token_local_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modules/login/login_module.dart';
import 'shared/external/adapters/http_client/dio/dio_adapter.dart';
import 'shared/external/adapters/http_client/dio/interceptors/dio_interceptor.dart';
import 'shared/external/adapters/http_client/http_client_adapter.dart';
import 'shared/presentation/themes/app_theme.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => const FlutterSecureStorage(), isLazy: false),
    Bind((i) => AppTheme()),
    Bind(((i) => TokenLocalDataSourceImpl(i.get()))),
    Bind((i) => TokenRepositoryImpl(i.get())),
    Bind((i) => SetTokenUsecaseImpl(i.get())),
    Bind((i) => FetchTokenUsecaseImpl(i.get())),
    Bind.factory(
        (i) => BaseOptions(baseUrl: 'https://books.ioasys.com.br/api/v1/')),
    Bind((i) => Dio(i.get())),
    Bind.factory<CustomInterceptors>((i) => CustomInterceptors(i.get())),
    Bind.factory<IHttpClientAdapter>(
        (i) => DioAdapter(dio: i.get(), interceptors: [i.get()])),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
