import 'package:biblioteczka/data/models/book_api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../styles/app_colors.dart';
import '../styles/app_shadows.dart';

class SmallBookWidget extends StatelessWidget {
  const SmallBookWidget(
      {this.bookAPi = const BookApi(title: 'title', author: 'author'),
      super.key});

  final BookApi bookAPi;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
            color: AppColors.kCol3,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [AppShadows.Shad2]),
        child: Column(
          children: [
            const Text('Book recomended:'),
            Text(bookAPi.title),
            Text(bookAPi.author),
          ],
        ));
  }
}
