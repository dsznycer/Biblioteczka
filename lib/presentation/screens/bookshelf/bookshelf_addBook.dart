import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/Models/book_model.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: AppColors.kCol4,
          borderRadius: BorderRadius.circular(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: (() =>
                        Utils.biblioteczkaNavigator.currentState!.pop()),
                    icon: const Icon(Icons.close),
                    iconSize: 30,
                  ),
                  Text(
                    'Dodaj książkę',
                    style: AppTextStyles.H2,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppTextInput(
                          hintText: 'Tytuł',
                          iconData: BiblioteczkaIcons.bookIcon,
                          labelValue: title),
                      AppTextInput(
                          hintText: 'Autor',
                          iconData: BiblioteczkaIcons.quoteIcon,
                          labelValue: author),
                      AppTextInput(
                          hintText: 'Ilość stron',
                          iconData: BiblioteczkaIcons.pagesIcon,
                          labelValue: pages),
                      AppTextInput(
                          hintText: 'Rok ukończenia',
                          iconData: BiblioteczkaIcons.calendarIcon,
                          labelValue: yearOfEnd),
                      FloatingActionButton.extended(
                        backgroundColor: AppColors.kCol3,
                        focusColor: AppColors.kCol2,
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
                        label: Text('Dodaj do biblioteczki'),
                        icon: Icon(BiblioteczkaIcons.addIcon),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
