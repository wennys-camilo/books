class BookEntity {
  final List<String> authors;
  final String title;
  final String description;
  final int pageCount;
  final String category;
  final String imageUrl;
  final String language;
  final String isbn10;
  final String isbn13;
  final String publisher;
  final int published;
  final String id;
  BookEntity({
    required this.authors,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.category,
    required this.imageUrl,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.publisher,
    required this.published,
    required this.id,
  });
}
