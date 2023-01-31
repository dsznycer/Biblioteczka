import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model.dart';

class BookshelfViewBook extends StatelessWidget {
  const BookshelfViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    final Book book = context.watch<SettingsCubit>().state.chosenBook;
    final List<Book> list = context.watch<BookCubit>().state.booksRed;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: AppColors.kCol3,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () =>
                          Utils.biblioteczkaNavigator.currentState!.pop(),
                      icon: Icon(Icons.close)),
                  Text(
                    'Twoja ksiązka',
                    style: AppTextStyles.TextLarge,
                  )
                ],
              ),
              Container(
                child: Image.asset('assets/photo/sampleBook.png'),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Tytuł:'),
                    Text(book.title),
                    Text('Autor:'),
                    Text(book.author),
                    Text('Przeczytano w:'),
                    Text(book.yearOfEnd)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<BookCubit>()
                            .removeBookAtIndex(list.indexOf(book));
                        Utils.biblioteczkaNavigator.currentState!.pop();
                      },
                      icon: const Icon(BiblioteczkaIcons.deleteIcon)),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
