import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/login/login_module.dart';
import 'shared/external/adapters/http_client/dio/dio_adapter.dart';
import 'shared/external/adapters/http_client/dio/interceptors/dio_interceptor.dart';
import 'shared/external/adapters/http_client/http_client_adapter.dart';
import 'shared/presentation/themes/app_theme.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppTheme()),
    Bind.factory(
        (i) => BaseOptions(baseUrl: 'https://books.ioasys.com.br/api/v1/')),
    Bind((i) => Dio(i.get())),
    Bind.factory<CustomInterceptors>((i) => CustomInterceptors()),
    Bind.factory<IHttpClientAdapter>(
        (i) => DioAdapter(dio: i.get(), interceptors: [i.get()])),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
