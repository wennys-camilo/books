import 'book_entity.dart';

class BookResponseEntity {
  final List<BookEntity> books;
  final int page;
  final int totalItems;
  final int totalPages;
  BookResponseEntity({
    required this.books,
    required this.page,
    required this.totalItems,
    required this.totalPages,
  });
}
