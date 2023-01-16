import 'package:biblioteczka/Data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          Expanded(
              child: Column(
            children: [Text(book.title), Text(book.author)],
          )),
        ]));
  }
}
