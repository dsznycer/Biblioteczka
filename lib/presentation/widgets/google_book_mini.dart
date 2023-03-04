import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GoogleBookMiniWidget extends StatelessWidget {
  const GoogleBookMiniWidget({required this.book, this.onTap, super.key});

  final GoogleBookItem book;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
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
      ),
    );
  }
}
