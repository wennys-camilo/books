import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../domain/entities/book_entity.dart';

class BodyDetailsWidget extends StatelessWidget {
  final BookEntity book;
  final bool detailsInDialog;
  const BodyDetailsWidget(
      {Key? key, required this.book, this.detailsInDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        book.imageUrl.isNotEmpty && detailsInDialog
            ? Flexible(
                child: Image.network(
                  book.imageUrl,
                ),
              )
            : detailsInDialog
                ? Flexible(
                    child: SvgPicture.asset(
                      theme.images.bookPlaceholder,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 600,
                    ),
                  )
                : Container(),
        detailsInDialog
            ? const SizedBox(
                width: 50,
              )
            : Container(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              !detailsInDialog
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(8, 15, 5, 15),
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Modular.to.pop(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    width: 1, color: theme.colors.grey),
                              ),
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
                    )
                  : Container(),
              !detailsInDialog
                  ? Center(
                      child: Image.network(
                        book.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              Text(
                book.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                textAlign: TextAlign.left,
                maxLines: 1,
              ),
              Row(
                children: [
                  ...List.generate(book.authors.length, (index) {
                    return Text(
                      "${book.authors[index]}${book.authors.length == index + 1 ? '.' : ', '}",
                      style: TextStyle(
                        color: theme.colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'INFORMAÇÕES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Páginas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${book.pageCount} páginas",
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Editora ${book.publisher}",
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${book.published}",
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    book.language,
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    book.title,
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    book.isbn10,
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    book.isbn13,
                    style: TextStyle(
                      color: theme.colors.greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'RESENHA DA EDITORA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  book.description,
                  style: TextStyle(
                    color: theme.colors.greyDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
