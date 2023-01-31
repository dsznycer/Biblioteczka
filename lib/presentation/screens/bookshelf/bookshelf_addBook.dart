import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAdd extends StatelessWidget {
  const BookAdd({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String author = '';
    String pages = '0';
    String yearOfEnd = '0';
    int score = 3;
    List<String> notes = const [];
    return SafeArea(
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (() =>
                        Utils.biblioteczkaNavigator.currentState!.pop()),
                    icon: const Icon(Icons.close)),
                Text(
                  'Dodaj ksiązkę',
                  style: AppTextStyles.H2,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Tytuł',
                        label:
                            Icon(Icons.airline_seat_recline_normal_outlined)),
                    onChanged: (value) => title = value,
                  ),
                  TextField(
                    onChanged: (value) => author = value,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => pages = value,
                  ),
                  TextField(
                    onChanged: (value) => yearOfEnd = value,
                  ),
                  MaterialButton(
                    color: AppColors.kCol3,
                    onPressed: () {
                      context.read<BookCubit>().addNewBook(Book(
                            author: author,
                            title: title,
                            score: score,
                            pages: pages,
                            yearOfEnd: yearOfEnd,
                            notes: notes,
                          ));
                      Utils.biblioteczkaNavigator.currentState!.pop();
                    },
                    child: Text('Dodaj do biblioteczki'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
