import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import 'body_details_widget.dart';

class ModalBottomWidget extends StatelessWidget {
  final BookEntity book;

  const ModalBottomWidget({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      height: MediaQuery.of(context).size.height * .90,
      child: SingleChildScrollView(child: BodyDetailsWidget(book: book)),
    );
  }
}
