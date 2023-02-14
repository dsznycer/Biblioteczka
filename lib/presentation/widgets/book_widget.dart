import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../data/Models/book_model.dart';

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
                flex: 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                        tag: heroTag, child: Image.network(book.urlPhoto)))),
            Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(book.title, style: AppTextStyles.H3),
                      Row(
                        children: [
                          Text(
                            'Autor:',
                            style: AppTextStyles.TextLarge,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                              child: Text(book.author,
                                  style: AppTextStyles.TextLarge)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: Divider(
                          color: AppColors.kCol2,
                        ),
                      ),
                      Text(book.yearOfEnd),
                      Text('Ocena: ${book.score}')
                    ],
                  ),
                )),
          ])),
    );
  }
}
