import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../data/Models/book_model.dart';
import '../styles/app_colors.dart';
import '../styles/app_shadows.dart';

class SmallBookWidget extends StatelessWidget {
  const SmallBookWidget(
      {this.bookAPi = const BookApi(
        book_id: '999',
        name: 'title',
        category: 'author',
        cover: 'https://ecsmedia.pl/c/bracia-karamazow-w-iext121646629.jpg',
      ),
      this.func,
      super.key});

  final BookApi bookAPi;
  final Function()? func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
          width: 150,
          height: 230,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: AppColors.kCol3,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [AppShadows.Shad2]),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(bookAPi.cover),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            bookAPi.name,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.TextMedium.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: bookAPi.category.isNotEmpty,
                      child: Text(
                        bookAPi.category,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Visibility(
                        visible: bookAPi.rating > 0,
                        child: Column(
                          children: [
                            Text('Ocena:'),
                            RatingBarSimple(
                              rate: bookAPi.rating,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class RatingBarSimple extends StatelessWidget {
  const RatingBarSimple({required this.rate, super.key});
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (double i = 0; i < rate; i++)
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            )
        ],
      ),
    );
  }
}
