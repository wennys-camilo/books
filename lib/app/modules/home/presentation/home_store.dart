import 'package:books/app/modules/home/domain/entities/book_entity.dart';
import 'package:books/app/modules/home/domain/entities/book_response_entity.dart';
import 'package:books/app/modules/home/domain/usecases/fetch_books_usecase.dart';
import 'package:books/app/modules/home/presentation/home_state.dart';
import 'package:books/app/shared/domain/helpers/errors/failure.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends StreamStore<Failure, HomeState> {
  final FetchBooksUsecase _fetchBooksUsecase;

  HomeStore(this._fetchBooksUsecase)
      : super(HomeState(
            bookResponseEntity: BookResponseEntity(
                books: [], page: 1, totalItems: 0, totalPages: 0),
            loading: false,
            page: -1));

  Future<void> fetchBooks({bool? next, bool? previous}) async {
    int? page;
    if (next != null && next) {
      page = state.bookResponseEntity.page + 1;
    } else if (previous != null &&
        previous &&
        state.bookResponseEntity.page > 0) {
      page = state.bookResponseEntity.page - 1;
    }
    final response = await _fetchBooksUsecase(page: page?.toString());
    response.fold(setError, (books) {
      update(state.copyWith(bookResponseEntity: books));
    });
  }

  Future<void> newBooks() async {
    update(state.copyWith(loading: true));
    int page = state.bookResponseEntity.page + 1;
    final response = await _fetchBooksUsecase(page: page.toString());
    response.fold(setError, (books) {
      List<BookEntity> previousList = [
        ...state.bookResponseEntity.books,
        ...books.books
      ];
      final BookResponseEntity bookResponseEntity = BookResponseEntity(
        books: previousList,
        page: books.page,
        totalItems: books.totalItems,
        totalPages: books.totalPages,
      );
      update(
          state.copyWith(bookResponseEntity: bookResponseEntity, page: page));
    });
    update(state.copyWith(loading: false));
  }
}
