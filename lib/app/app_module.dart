import 'modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/shared/presentation/themes/app_theme.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppTheme()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
