import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../data/Models/BookModels/book_model.dart';

class BookWidget extends StatelessWidget {
  BookWidget(
      {required this.book, this.onTap, required this.heroTag, super.key});

  final Book book;
  void Function()? onTap;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 300,
          height: 140,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.kCol3,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [AppShadows.Shad2]),
          child: Row(children: [
            Expanded(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      book.urlPhoto,
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, maxLines: 2, style: AppTextStyles.TextLarge),
                  const Text('Autor:', style: AppTextStyles.TextMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(book.author,
                              style: AppTextStyles.TextMedium)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      color: AppColors.kCol2,
                    ),
                  ),
                  Text(book.yearOfEnd),
                  Visibility(
                      visible: book.bookProgress == BookProgress.red,
                      child: Text(
                        'Twoja ocena: ${book.score}',
                        maxLines: 3,
                        style: AppTextStyles.TextLarge,
                      ))
                ],
              ),
            )),
          ])),
    );
  }
}
