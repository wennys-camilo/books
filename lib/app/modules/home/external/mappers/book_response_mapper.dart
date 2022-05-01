import 'package:books/app/modules/home/domain/entities/book_response_entity.dart';
import 'package:books/app/modules/home/external/mappers/book_mapper.dart';
import '../../domain/entities/book_entity.dart';

class BookReponseMapper {
  BookResponseEntity from(Map<String, dynamic> map) {
    return BookResponseEntity(
      books:
          List<BookEntity>.from(map['data']?.map((x) => BookMapper().from(x))),
      page: map['page']?.toInt() ?? 0,
      totalItems: map['totalItems']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
    );
  }
}
