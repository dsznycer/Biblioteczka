import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/Models/book_model.dart';

class BookAdd extends StatelessWidget {
  BookAdd({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 20),
                  Text(
                    'Dodaj książkę',
                    style: AppTextStyles.H3,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AppTextInput(
                            hintText: 'Tytuł',
                            iconData: BiblioteczkaIcons.bookIcon,
                            onChanged: (value) => context
                                .read<BookCubit>()
                                .updateFormTitle(value)),
                        AppTextInput(
                          hintText: 'Autor',
                          iconData: BiblioteczkaIcons.quoteIcon,
                          onChanged: (value) =>
                              context.read<BookCubit>().updateFormAuthor(value),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextInput(
                                hintText: 'Ilość stron',
                                iconData: BiblioteczkaIcons.pagesIcon,
                                onChanged: (value) => context
                                    .read<BookCubit>()
                                    .updateFormPages(value),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: AppTextInput(
                                hintText: 'Rok ukończenia',
                                iconData: BiblioteczkaIcons.calendarIcon,
                                onChanged: (value) => context
                                    .read<BookCubit>()
                                    .updateFormYearOfEnd(value),
                              ),
                            ),
                          ],
                        ),
                        ChooseLine(),
                        FloatingActionButton.small(
                            onPressed: () => print(
                                context.read<BookCubit>().state.bookForm)),
                        const SizedBox(height: 20),
                        FloatingActionButton.extended(
                          backgroundColor: AppColors.kCol3,
                          focusColor: AppColors.kCol2,
                          onPressed: () {
                            context.read<BookCubit>().addNewBookToList();
                            Utils.biblioteczkaNavigator.currentState!.pop();
                          },
                          label: Text('Dodaj do biblioteczki'),
                          icon: Icon(BiblioteczkaIcons.addIcon),
                        )
                      ],
                    ),
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

//TODO: refactore it to separated class
class ChooseLine extends StatelessWidget {
  ChooseLine({super.key});

  BookProgress object = BookProgress.inProgress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return SegmentedButton(
          segments: const [
            ButtonSegment(value: BookProgress.red, label: Text('Przeczytane')),
            ButtonSegment(
                value: BookProgress.toRead, label: Text('Chcę przeczytać')),
            ButtonSegment(
                value: BookProgress.inProgress, label: Text('W trakcie')),
          ],
          selected: {state.bookForm.bookProgress},
          onSelectionChanged: (Set<BookProgress> newSelection) {
            object = newSelection.first;
            context.read<BookCubit>().updateBookFormProgress(object);
          },
        );
      },
    );
  }
}
