import 'package:books/app/modules/home/domain/entities/book_entity.dart';
import 'package:books/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookCardWidget extends StatelessWidget {
  final BookEntity book;
  const BookCardWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: book.imageUrl.isNotEmpty
                  ? Image.network(
                      book.imageUrl,
                    )
                  : SvgPicture.asset(
                      Modular.get<AppTheme>().images.bookPlaceholder,
                      fit: BoxFit.cover,
                      height: 180,
                    ),
            ),
            Flexible(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ...book.authors.map((author) {
                      return Column(
                        children: [
                          Text(
                            author,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Modular.get<AppTheme>().colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    Text(
                      '${book.pageCount} páginas',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "Editora ${book.publisher}",
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Publicado em ${book.published}",
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
