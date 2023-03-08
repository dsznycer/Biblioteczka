import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/google_book_mini.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/book_widget.dart';
import '../../widgets/small_book_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool darkMode = context.select((SettingsCubit s) => s.state.darkMode);

    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        return SafeArea(
          child: Column(
            children: [
              // Row with button and photo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: Switch(
                        activeColor: Colors.white30,
                        inactiveTrackColor: Colors.black12,
                        value: darkMode,
                        onChanged: (value) => context
                            .read<SettingsCubit>()
                            .changeDarkMode(value)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Utils.mainNavigator.currentState!
                          .pushReplacementNamed('/ProfileScreen');
                      context.read<SettingsCubit>().changeIndex(3);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/photo/profile_pick.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Search line
                      Container(
                        height: 60,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CupertinoSearchTextField(
                          controller: textEditingController,
                          onChanged: (String text) {
                            context.read<BookCubit>().searchGoogleBooks(
                                textEditingController.text.trim());

                            if (textEditingController.text == '') {
                              context.read<BookCubit>().removeSearchedBooks();
                            }
                          },
                          onSuffixTap: () {
                            textEditingController.clear();
                            context.read<BookCubit>().removeSearchedBooks();
                          },
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: size.width,
                        height: state.googleBooks.isNotEmpty ? 300 : 0,
                        child: state.googleBooks.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.googleBooks.length,
                                itemBuilder: (context, index) =>
                                    GoogleBookMiniWidget(
                                      book: state.googleBooks[index],
                                      onTap: () {
                                        context
                                            .read<BookCubit>()
                                            .changeBookGoogle(
                                                state.googleBooks[index]);
                                        Utils.homeNavigator.currentState!
                                            .pushNamed('/ViewBook');
                                      },
                                    ))
                            : const Center(
                                child: Text(
                                    'Tutaj pojawią się wyszukane książki')),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Aktualnie czytasz:',
                          style: AppTextStyles.H2,
                        ),
                      ),
                      //TODO: put tile view here
                      SizedBox(
                        width: size.width,
                        height: 300,
                        child: state.booksReading.isNotEmpty
                            ? BookWidget(
                                onTap: () {
                                  context.read<BookCubit>().changeChoosenBook(
                                      state.booksReading.first, 'heroTag');
                                  // Utils.homeNavigator.currentState!
                                  //     .push('/viewBook');
                                },
                                book: state.booksReading.last,
                                heroTag: 'main')
                            : Center(
                                child: Container(
                                  width: 300,
                                  height: 60,
                                  child: const Text(
                                    'Tutaj pojawi się aktualnie czytana książka!',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                                onPressed: () => context
                                    .read<BookCubit>()
                                    .removeLastBookReading(),
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColors.kCol2,
                                )),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Polecane:',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.9,
                        height: 260,
                        child: state.status == BookStateStatus.withData
                            ? ListView.builder(
                                itemCount: state.recomendedBooks.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return SmallBookWidget(
                                    bookAPi: state.recomendedBooks[index],
                                  );
                                })
                            : CircularProgressIndicator.adaptive(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
