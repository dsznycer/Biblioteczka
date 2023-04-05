import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/Models/BookModels/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridBookShelf extends StatelessWidget {
  const GridBookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    Map<BookProgress, String> titleOfGridView = {
      BookProgress.inProgress: 'Czytane książki:',
      BookProgress.toRead: 'Książki do przeczytania:',
      BookProgress.red: 'Przeczytane książki:',
    };
    final darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return SafeArea(
          child: Material(
            color: darkMode ? AppColors.kCol5 : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            Utils.biblioteczkaNavigator.currentState!.pop(),
                        icon: const RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            BiblioteczkaIcons.backArrowIcon,
                            size: 35,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        titleOfGridView[state.chosenList.first.bookProgress]!,
                        style: AppTextStyles.H3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemCount: state.chosenList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context.read<BookCubit>().changeChoosenBook(
                              state.chosenList[index], index.toString() + 'c');
                          Utils.biblioteczkaNavigator.currentState!
                              .pushNamed('/viewBook');
                        },
                        child: Hero(
                          tag: index.toString() + 'c',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              state.chosenList[index].urlPhoto,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
