import '../../domain/entities/book_entity.dart';

class BookMapper {
  BookEntity from(Map<String, dynamic> map) {
    return BookEntity(
      authors: List<String>.from(map['authors']),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      pageCount: map['pageCount']?.toInt() ?? 0,
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      language: map['language'] ?? '',
      isbn10: map['isbn10'] ?? '',
      isbn13: map['isbn13'] ?? '',
      publisher: map['publisher'] ?? '',
      published: map['published']?.toInt() ?? 0,
      id: map['id'] ?? '',
    );
  }
}
