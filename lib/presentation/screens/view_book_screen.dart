import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../styles/app_icons.dart';
import '../styles/app_shadows.dart';
import '../widgets/progress_line.dart';

class ViewBook extends StatelessWidget {
  const ViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);

    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Material(
            color: darkMode ? AppColors.kCol5 : Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 60, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Stack with book photo
                    Container(
                      width: size.width,
                      height: size.height / 2,
                      padding: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: AppColors.kCol3,
                          boxShadow: [AppShadows.Shad2],
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
                          // Photo of book
                          Positioned(
                            top: 55,
                            child: Hero(
                              tag: state.heroTag,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: size.height / 3.3,
                                  decoration: const BoxDecoration(
                                      color: AppColors.kCol4,
                                      boxShadow: [AppShadows.Shad4]),
                                  child: Image.network(
                                    state.choosenBook.urlPhoto,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Title of book
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: SizedBox(
                              height: size.height / 8,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(state.choosenBook.title,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.H3.copyWith(
                                          overflow: TextOverflow.ellipsis)),
                                  Text('by ${state.choosenBook.author}',
                                      style: AppTextStyles.TextLarge),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Visibility(
                          visible: state.choosenBook.pages.length > 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Ilość stron:',
                                  style: AppTextStyles.TextLarge,
                                ),
                                Text(state.choosenBook.pages,
                                    style: AppTextStyles.TextLarge)
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: state.choosenBook.yearOfEnd.isNotEmpty,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Przeczytano w:',
                                  style: AppTextStyles.TextLarge,
                                ),
                                Text(state.choosenBook.yearOfEnd,
                                    style: AppTextStyles.TextLarge)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ChangeBookListAndProgress(),

                    const SizedBox(height: 15),

                    FilledButton.tonal(
                        onPressed: () {
                          context
                              .read<BookCubit>()
                              .removeBookFromList(state.choosenBook);

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
