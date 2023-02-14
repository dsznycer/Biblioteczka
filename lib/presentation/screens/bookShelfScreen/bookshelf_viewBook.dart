import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookshelfViewBook extends StatelessWidget {
  const BookshelfViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    final Book book = context.watch<SettingsCubit>().state.chosenBook;
    final String heroTag = context.watch<SettingsCubit>().state.heroTag;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Material(
        color: AppColors.kCol3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    IconButton(
                        onPressed: () =>
                            Utils.biblioteczkaNavigator.currentState!.pop(),
                        icon: Icon(Icons.close)),
                    Text(
                      'Twoja ksiązka',
                      style: AppTextStyles.H3,
                    )
                  ],
                ),
                Container(
                  height: size.height / 2.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                        tag: heroTag,
                        child: Image.network(
                          book.urlPhoto,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Tytuł:',
                      style: AppTextStyles.H3,
                    ),
                    Text(book.title),
                    Text('Autor:'),
                    Text(book.author),
                    Text('Przeczytano w:'),
                    Text(book.yearOfEnd)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<BookCubit>().removeBookFromList(book);

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
      ),
    );
  }
}
