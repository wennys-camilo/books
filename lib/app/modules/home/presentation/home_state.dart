import 'package:books/app/modules/home/domain/entities/book_response_entity.dart';

class HomeState {
  final BookResponseEntity bookResponseEntity;
  final int page;
  final bool loading;
  HomeState({
    required this.bookResponseEntity,
    required this.page,
    required this.loading,
  });

  HomeState copyWith({
    BookResponseEntity? bookResponseEntity,
    int? page,
    bool? loading,
  }) {
    return HomeState(
      bookResponseEntity: bookResponseEntity ?? this.bookResponseEntity,
      page: page ?? this.page,
      loading: loading ?? this.loading,
    );
  }

  bool get isFinalPage => bookResponseEntity.totalPages == page;
}
