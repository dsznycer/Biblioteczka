import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/rating_bar.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                    onPressed: (() {
                      context.read<BookCubit>().removeSearchedBooks();
                      Utils.biblioteczkaNavigator.currentState!.pop();
                    }),
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
                child: BlocBuilder<BookCubit, BookState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AppTextInput(
                                hintText: 'Tytuł',
                                iconData: BiblioteczkaIcons.bookIcon,
                                onChanged: (value) {
                                  context
                                      .read<BookCubit>()
                                      .updateFormTitle(value);
                                  context
                                      .read<BookCubit>()
                                      .searchGoogleBooks(value);
                                }),
                            AppTextInput(
                              hintText: 'Autor',
                              iconData: BiblioteczkaIcons.quoteIcon,
                              onChanged: (value) => context
                                  .read<BookCubit>()
                                  .updateFormAuthor(value),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextInput(
                                    hintText: 'Ilość stron',
                                    keyboardType: TextInputType.number,
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
                            Visibility(
                              visible: state.bookForm.bookProgress ==
                                      BookProgress.red
                                  ? true
                                  : false,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Twoja ocena:',
                                    style: AppTextStyles.H3,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: RatingBar.builder(
                                          itemCount: 5,
                                          allowHalfRating: true,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                                  BiblioteczkaIcons.bookIcon,
                                                  color: AppColors.kCol2),
                                          onRatingUpdate: (rate) => context
                                              .read<BookCubit>()
                                              .updateFormScore(rate))),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: FilledButton.tonal(
                                  onPressed: () => Utils
                                      .biblioteczkaNavigator.currentState!
                                      .pushReplacementNamed('/addBookPhoto'),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Dodaj okładkę'),
                                      Icon(Icons.add),
                                    ],
                                  )),
                            ),
                            Column(
                              children: [
                                Text('Wybierz okładkę:',
                                    style: AppTextStyles.H3),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    height: 250,
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 5,
                                                crossAxisCount: 3),
                                        itemCount: state.googleBooks.length,
                                        itemBuilder: (context, index) {
                                          String photo = state
                                              .googleBooks[index]
                                              .volumeInfo
                                              .imageLinks
                                              .values
                                              .last;

                                          return InkWell(
                                            onTap: () => context
                                                .read<BookCubit>()
                                                .updateFormPhoto(photo),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(photo),
                                            ),
                                          );
                                        })),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: AppColors.kCol3,
                  focusColor: AppColors.kCol2,
                  onPressed: () {
                    context.read<BookCubit>().addNewBookToList();
                    context.read<BookCubit>().removeSearchedBooks();
                    Utils.biblioteczkaNavigator.currentState!.pop();
                  },
                  label: const Text('Dodaj do biblioteczki'),
                  icon: const Icon(BiblioteczkaIcons.addIcon),
                ),
              )
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
            ButtonSegment(
                value: BookProgress.red,
                label: Text(
                  'Przeczytane',
                )),
            ButtonSegment(
                value: BookProgress.toRead,
                label: Text(
                  'Chcę przeczytać',
                )),
            ButtonSegment(
                value: BookProgress.inProgress,
                label: Text(
                  'W trakcie',
                )),
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
