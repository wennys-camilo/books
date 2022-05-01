import 'package:books/app/modules/home/presentation/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/fetch_books_usecase_impl.dart';
import 'external/datasources/books_remote_datasource_impl.dart';
import 'infra/repositories/book_repository_impl.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(((i) => BooksRemoteDataSourceImpl(i.get()))),
    Bind(((i) => BookRepositoryImpl(i.get()))),
    Bind(((i) => FetchBooksUsecaseImpl(i.get()))),
    Bind(((i) => HomeStore(i.get())))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
