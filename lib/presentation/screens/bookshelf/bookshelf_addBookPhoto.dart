import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
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
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: AppColors.kCol4,
        borderRadius: BorderRadius.circular(14),
        child: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            return Column(
              children: [
                AppTextInput(
                    hintText: 'Tytuł książki',
                    iconData: BiblioteczkaIcons.searchIcon,
                    onChanged: (e) => print('e')),
                Text('Wybierz okładkę:', style: AppTextStyles.H3),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 5, crossAxisCount: 3),
                        itemCount: state.googleBooks.length,
                        itemBuilder: (context, index) {
                          String photo = state.googleBooks[index].volumeInfo
                              .imageLinks.values.last;

                          return InkWell(
                            onTap: () => context
                                .read<BookCubit>()
                                .updateFormPhoto(photo),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(photo),
                            ),
                          );
                        })),
              ],
            );
          },
        ),
      ),
    ));
  }
}
