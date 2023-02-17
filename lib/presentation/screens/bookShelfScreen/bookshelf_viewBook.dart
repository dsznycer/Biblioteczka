import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/progress_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookshelfViewBook extends StatelessWidget {
  const BookshelfViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Material(
            color: state.darkMode ? AppColors.kCol5 : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Stack with book photo
                    Container(
                      width: size.width,
                      height: size.height / 2,
                      padding: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          color: AppColors.kCol3,
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () => Utils
                                        .biblioteczkaNavigator.currentState!
                                        .pop(),
                                    icon: const Icon(Icons.close)),
                                const SizedBox(width: 25),
                                const Text(
                                  'Twoja ksiązka',
                                  style: AppTextStyles.H3,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: size.height / 3.3,
                                decoration: const BoxDecoration(
                                    color: AppColors.kCol4,
                                    boxShadow: [AppShadows.Shad2]),
                                child: Hero(
                                    tag: state.heroTag,
                                    child: Image.network(
                                      state.chosenBook.urlPhoto,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 25,
                            child: Column(
                              children: [
                                Text(state.chosenBook.title,
                                    style: AppTextStyles.H2),
                                Text('by ${state.chosenBook.author}',
                                    style: AppTextStyles.TextLarge),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Przeczytano w:'),
                        Visibility(
                            visible: state.chosenBook.bookProgress ==
                                BookProgress.red,
                            child: Text(state.chosenBook.yearOfEnd))
                      ],
                    ),
                    ChooseLine(),
                    FilledButton.tonal(
                        onPressed: () {
                          context
                              .read<BookCubit>()
                              .removeBookFromList(state.chosenBook);

                          Utils.biblioteczkaNavigator.currentState!.pop();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Usuń książkę'),
                            SizedBox(width: 5),
                            Icon(BiblioteczkaIcons.deleteIcon),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
