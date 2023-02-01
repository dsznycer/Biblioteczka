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
          cover: 'https://ecsmedia.pl/c/bracia-karamazow-w-iext121646629.jpg'),
      super.key});

  final BookApi bookAPi;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 150,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.kCol3,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [AppShadows.Shad2]),
        child: Column(
          children: [
            Expanded(flex: 3, child: Image.network(bookAPi.cover)),
            Expanded(
              child: Column(
                children: [
                  Text(bookAPi.name),
                  Text(bookAPi.category),
                ],
              ),
            ),
          ],
        ));
  }
}
