import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 150,
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.kCol3, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.asset(
              '/Users/dominiksznycer/StudioProjects/biblioteczka/assets/photo/bookShop.png',
              fit: BoxFit.fitWidth,
            ),
          )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text(book.title), Text(book.author)],
              )),
        ]));
  }
}
