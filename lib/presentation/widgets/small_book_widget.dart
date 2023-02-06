import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../data/models/book_model.dart';
import '../styles/app_colors.dart';
import '../styles/app_shadows.dart';

class SmallBookWidget extends StatelessWidget {
  const SmallBookWidget(
      {this.bookAPi = const BookApi(
          name: 'title',
          category: 'author',
          cover: 'https://ecsmedia.pl/c/bracia-karamazow-w-iext121646629.jpg',
          bookId: '999'),
      super.key});

  final BookApi bookAPi;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 230,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.kCol3,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [AppShadows.Shad2]),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                              fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    bookAPi.category,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
