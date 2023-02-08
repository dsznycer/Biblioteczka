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
    String photoUrl;
    if (book.volumeInfo.imageLinks != null) {
      photoUrl = book.volumeInfo.imageLinks!['thumbnail']!;
    } else {
      photoUrl =
          'https://images.unsplash.com/photo-1611915387288-fd8d2f5f928b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80)';
    }

    return Container(
      width: 250,
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(photoUrl), fit: BoxFit.fill),
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
