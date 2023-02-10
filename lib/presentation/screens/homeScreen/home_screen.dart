import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
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
    final mode = context.select((SettingsCubit s) => s.state.darkMode);

    return Scaffold(
      backgroundColor:
          mode == true ? Color.fromARGB(255, 224, 218, 218) : Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          String search = '';
          return SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: Switch(
                          activeColor: Colors.white30,
                          inactiveTrackColor: Colors.black12,
                          value: mode,
                          onChanged: (value) => context
                              .read<SettingsCubit>()
                              .changeDarkMode(value)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/photo/profile_pick.jpg'),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 60,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CupertinoSearchTextField(
                            controller: textEditingController,
                            onChanged: (String text) {
                              search = text;
                              if (search == '') {
                                context.read<BookCubit>().removeSearchedBooks();
                              }
                            },
                            onSubmitted: (search) => context
                                .read<BookCubit>()
                                .searchGoogleBooks(search),
                            onSuffixTap: () {
                              textEditingController.clear();
                              context.read<BookCubit>().removeSearchedBooks();
                            },
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: size.width,
                          height: state.googleBooks.isNotEmpty ? 300 : 40,
                          child: state.googleBooks.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.googleBooks.length,
                                  itemBuilder: (context, index) =>
                                      GoogleBookMiniWidget(
                                        book: state.googleBooks[index],
                                      ))
                              : const Center(
                                  child: Text(
                                      'Tutaj pojawią się wyszukane książki')),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Aktualnie czytasz:',
                            style: AppTextStyles.H2,
                          ),
                        ),
                        //TODO: put tile view here
                        Container(
                          width: size.width,
                          height: 300,
                          child: state.booksReading.isNotEmpty
                              ? BookWidget(book: state.booksReading.last)
                              : Center(
                                  child: Container(
                                    width: 300,
                                    height: 80,
                                    child: Text(
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
                                  onPressed: () {
                                    context
                                        .read<BookCubit>()
                                        .getBestBooksOfYear('2021');
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.kCol2,
                                  )),
                            ),
                            Expanded(
                              child: IconButton(
                                  onPressed: () => print(
                                      context.read<BookCubit>().state.status),
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColors.kCol2,
                                  )),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
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
      ),
    );
  }
}
