import 'package:books/app/modules/login/presentation/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'external/datasources/login_remote_datasource_impl.dart';
import 'presentation/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(((i) => LoginRemoteDataSourceImpl(i.get()))),
    Bind((i) => LoginStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
