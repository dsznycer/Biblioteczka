import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/buttons.dart';
import 'package:biblioteczka/presentation/widgets/progress_line.dart';
import 'package:biblioteczka/presentation/widgets/rating_bar.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

class BookAdd extends StatelessWidget {
  const BookAdd({super.key});

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
                      context.read<BookCubit>().removeBookFormData();
                      Utils.biblioteczkaNavigator.currentState!
                          .pushReplacementNamed('/');
                    }),
                    icon: const Icon(Icons.close),
                    iconSize: 30,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Dodaj książkę',
                    style: AppTextStyles.H2,
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
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 225,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      state.bookForm.urlPhoto,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 200,
                                  child: FilledButton.tonal(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => 5)),
                                      onPressed: () => Utils
                                          .biblioteczkaNavigator.currentState!
                                          .pushNamed('/addBookPhoto'),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text('Wybierz okładkę'),
                                          Icon(Icons.add),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            AppTextInput(
                                hintText: 'Tytuł',
                                iconData: BiblioteczkaIcons.bookIcon,
                                onChanged: (value) {
                                  context
                                      .read<BookCubit>()
                                      .updateFormTitle(value);
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
                                const SizedBox(width: 10),
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
                            // Container with rating of book
                            Visibility(
                              visible: state.bookForm.bookProgress ==
                                      BookProgress.red
                                  ? true
                                  : false,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Twoja ocena:',
                                      style: AppTextStyles.H3,
                                    ),
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
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              BasicButton(
                func: () {
                  context.read<BookCubit>().addNewBookToListFromForm();
                  context.read<BookCubit>().removeSearchedBooks();
                  context.read<BookCubit>().removeBookFormData();
                  Utils.biblioteczkaNavigator.currentState!
                      .pushReplacementNamed('/');
                },
                text: 'Dodaj do biblioteczki',
                icon: const Icon(BiblioteczkaIcons.addIcon),
              )
            ],
          ),
        ),
      ),
    );
  }
}
