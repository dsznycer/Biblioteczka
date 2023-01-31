import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  BookWidget({required this.book, this.onTap, super.key});

  final Book book;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 300,
          height: 150,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.kCol3,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [AppShadows.Shad2]),
          child: Row(children: [
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Image.asset(
                'assets/photo/bookShop.png',
                fit: BoxFit.fitHeight,
              ),
            )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(book.title),
                      Row(
                        children: [
                          Text('Autor:'),
                          Text(book.author),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: Divider(
                          color: AppColors.kCol2,
                        ),
                      ),
                      Text(book.yearOfEnd),
                      Text('AND THE SCORE IS: ${book.score}')
                    ],
                  ),
                )),
          ])),
    );
  }
}
