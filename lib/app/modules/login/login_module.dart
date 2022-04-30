import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/login_usecase_impl.dart';
import 'external/datasources/remote/login_remote_datasource_impl.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'presentation/login_page.dart';
import 'presentation/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(((i) => LoginRemoteDataSourceImpl(i.get()))),
    Bind(((i) => LoginRepositoryImpl(i.get()))),
    Bind(((i) => LoginUsecaseImpl(i.get()))),
    Bind((i) => LoginStore(i.get(), i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
