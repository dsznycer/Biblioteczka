import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GoogleBookMiniWidget extends StatelessWidget {
  const GoogleBookMiniWidget({required this.book, super.key});

  final GoogleBookItem book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(book.volumeInfo.imageLinks.values.last),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        Expanded(
            child: Text(
          book.volumeInfo.title,
          style: AppTextStyles.H3,
        ))
      ]),
    );
  }
}
