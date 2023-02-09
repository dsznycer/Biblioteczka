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
    final List<Book> list = context.watch<BookCubit>().state.booksRed;
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
                      style: AppTextStyles.TextLarge,
                    )
                  ],
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              'https://s2982.pcdn.co/wp-content/uploads/2019/01/The-Binding-by-Bridget-Collins-709x1024.jpg.optimal.jpg'))),
                ),
                Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<BookCubit>()
                              .removeRedBookAtIndex(list.indexOf(book));
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
