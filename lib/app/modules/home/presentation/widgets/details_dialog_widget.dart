import 'package:books/app/modules/home/domain/entities/book_entity.dart';
import 'package:books/app/modules/home/presentation/widgets/body_details_widget.dart';
import 'package:flutter/material.dart';

class DetailsDialogWidget extends StatelessWidget {
  final BookEntity book;

  const DetailsDialogWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 700),
        width: MediaQuery.of(context).size.width * 0.75,
        child: BodyDetailsWidget(
          book: book,
          detailsInDialog: true,
        ),
      ),
    );
  }
}
