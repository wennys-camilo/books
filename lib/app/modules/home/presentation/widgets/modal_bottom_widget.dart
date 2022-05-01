import 'package:books/app/modules/home/domain/entities/book_entity.dart';
import 'package:books/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalBottomWidget extends StatelessWidget {
  final BookEntity book;

  const ModalBottomWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      height: MediaQuery.of(context).size.height * .90,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 5, 15),
              child: Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Modular.to.pop(),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border:
                              Border.all(width: 1, color: theme.colors.grey)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                ...List.generate(book.authors.length, (index) {
                  return Text(
                    "${book.authors[index]}${book.authors.length == index + 1 ? '.' : ', '}",
                    style: TextStyle(
                        color: theme.colors.pink, fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'INFORMAÇÕES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Páginas',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "${book.pageCount} páginas",
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Editora',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "Editora ${book.publisher}",
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Publicação',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "${book.published}",
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Idioma',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  book.language,
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Título Original',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  book.title,
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'ISBN-10',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  book.isbn10,
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'ISBN-13',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  book.isbn13,
                  style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'RESENHA DA EDITORA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                book.description,
                style: TextStyle(
                    color: theme.colors.greyDark, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
