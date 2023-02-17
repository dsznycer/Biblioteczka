import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBookPhoto extends StatelessWidget {
  const AddBookPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Material(
        elevation: 2,
        color: AppColors.kCol4,
        borderRadius: BorderRadius.circular(14),
        child: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Row with arrow to get one screen back
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<BookCubit>().removeSearchedBooks();
                          Utils.biblioteczkaNavigator.currentState!.pop();
                        },
                        child: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              BiblioteczkaIcons.backArrowIcon,
                              size: 40,
                            )),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        'Wybierz okładkę',
                        style: AppTextStyles.H3,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
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
                        padding: const EdgeInsets.only(top: 5),
                        width: 200,
                        child: FilledButton.tonal(
                          onPressed: () {
                            context.read<BookCubit>().removeSearchedBooks();
                            Utils.biblioteczkaNavigator.currentState!.pop();
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.resolveWith(
                                  (states) => 5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('Dodaj okładke'),
                              Icon(BiblioteczkaIcons.addIcon),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppTextInput(
                    hintText: 'Tytuł książki',
                    iconData: BiblioteczkaIcons.searchIcon,
                    onChanged: (value) =>
                        context.read<BookCubit>().searchGoogleBooks(value),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('Wybierz okładkę:', style: AppTextStyles.H3),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      height: 300,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5, crossAxisCount: 3),
                          itemCount: state.googleBooks.length,
                          itemBuilder: (context, index) {
                            String photo = state.googleBooks[index].volumeInfo
                                .imageLinks.values.last;

                            return InkWell(
                              onTap: () {
                                context
                                    .read<BookCubit>()
                                    .updateFormPhoto(photo);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(photo),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
