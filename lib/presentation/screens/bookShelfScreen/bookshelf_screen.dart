import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/book_widget.dart';

class BookShelf extends StatelessWidget {
  BookShelf({Key? key}) : super(key: key);

  Map<String, String> snackBarInfo = {
    '+': 'Udało się dodać książkę!',
    '-': 'Udało się usunąc książkę.'
  };

  String messageOfSnackBar = 'empty';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return BlocConsumer<BookCubit, BookState>(
      listenWhen: (previous, current) {
        if (previous.lengthOfAllList < current.lengthOfAllList) {
          messageOfSnackBar = snackBarInfo['+']!;
          return true;
        } else if (previous.lengthOfAllList > current.lengthOfAllList) {
          messageOfSnackBar = snackBarInfo['-']!;
          return true;
        }
        return false;
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              showCloseIcon: true,
              content: Text(messageOfSnackBar)));
      },
      builder: (context, state) {
        return SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Row with title and logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Biblioteczka',
                          style: AppTextStyles.H2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Image.asset(
                          'assets/photo/biblio-sygnet-kadrowany.png',
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                  // Titile "Prezeczytane w tym roku:"
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Przeczytane w tym roku:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: _size.width,
                    height: 250,
                    child: state.redInCurrentYear.isEmpty
                        ? Center(
                            child: Text(
                                'Tu pojawia się przeczytane w tym roku książki.'),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.redInCurrentYear.length,
                            itemBuilder: (context, int index) {
                              return BookWidget(
                                  heroTag: index.toString() + 'a',
                                  book: state.redInCurrentYear[index],
                                  onTap: () {
                                    context.read<BookCubit>().changeChoosenBook(
                                        state.redInCurrentYear[index],
                                        index.toString() + 'a');
                                    Utils.biblioteczkaNavigator.currentState!
                                        .pushNamed('/viewBook');
                                  });
                            }),
                  ),
                  Visibility(
                    visible: state.redInCurrentYear.isNotEmpty,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          child: FloatingActionButton.small(
                            onPressed: () {
                              context
                                  .read<BookCubit>()
                                  .choosenList(state.redInCurrentYear);
                              Utils.biblioteczkaNavigator.currentState!
                                  .pushNamed('/GridBookShelf');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Zobacz wszystkie'),
                                Icon(BiblioteczkaIcons.backArrowIcon)
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () =>
                                context.read<BookCubit>().removeLastBooksRed(),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.blueAccent,
                            )),
                      ],
                    ),
                  ),
                  // Titile "Do przeczytania:"
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Do przeczytania:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: _size.width,
                    height: 250,
                    child: state.booksToRead.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.booksToRead.length,
                            itemBuilder: (context, int index) {
                              return BookWidget(
                                  heroTag: index.toString() + 'b',
                                  book: state.booksToRead[index],
                                  onTap: () {
                                    context.read<BookCubit>().changeChoosenBook(
                                        state.booksToRead[index],
                                        index.toString() + 'b');
                                    Utils.biblioteczkaNavigator.currentState!
                                        .pushNamed('/viewBook');
                                  });
                            })
                        : const Center(
                            child: Text(
                                'Tutaj pojawią się książki, które chcesz przeczytać!'),
                          ),
                  ),
                  Visibility(
                    visible: state.booksToRead.isNotEmpty,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          child: FloatingActionButton.small(
                            heroTag: null,
                            onPressed: () {
                              context
                                  .read<BookCubit>()
                                  .choosenList(state.booksToRead);
                              Utils.biblioteczkaNavigator.currentState!
                                  .pushNamed('/GridBookShelf');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('Zobacz wszystkie'),
                                Icon(BiblioteczkaIcons.backArrowIcon)
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () => context
                                .read<BookCubit>()
                                .removeLastBooksToRed(),
                            icon: const Icon(BiblioteczkaIcons.deleteIcon)),
                      ],
                    ),
                  ),
                  // Box with title "Wszystkie przeczytane"
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: const Text('Wszystkie przeczytane',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400))),
                  SizedBox(
                    height: 250,
                    child: state.booksRed.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.booksRed.length,
                            itemBuilder: (context, index) => BookWidget(
                                  heroTag: index.toString() + 'c',
                                  book: state.booksRed[index],
                                  onTap: () {
                                    context.read<BookCubit>().changeChoosenBook(
                                        state.booksRed[index],
                                        index.toString() + 'c');
                                    Utils.biblioteczkaNavigator.currentState!
                                        .pushNamed('/viewBook');
                                  },
                                ))
                        : const Center(
                            child: Text(
                                'Tutaj pojawią się książki, które przeczytałeś!'),
                          ),
                  ),
                  Visibility(
                    visible: state.booksRed.isNotEmpty,
                    child: SizedBox(
                      width: 200,
                      child: FloatingActionButton.small(
                        heroTag: null,
                        onPressed: () {
                          context.read<BookCubit>().choosenList(state.booksRed);
                          Utils.biblioteczkaNavigator.currentState!
                              .pushNamed('/GridBookShelf');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text('Zobacz wszystkie'),
                            Icon(BiblioteczkaIcons.backArrowIcon)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: const Text('Aktualnie czytane:',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400))),
                  SizedBox(
                    height: 250,
                    child: state.booksReading.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.booksReading.length,
                            itemBuilder: (context, index) => BookWidget(
                                  heroTag: index.toString() + 'd',
                                  book: state.booksReading[index],
                                  onTap: () {
                                    context.read<BookCubit>().changeChoosenBook(
                                        state.booksReading[index],
                                        index.toString() + 'd');
                                    Utils.biblioteczkaNavigator.currentState!
                                        .pushNamed('/viewBook');
                                  },
                                ))
                        : const Center(
                            child: Text(
                                'Tutaj pojawią się aktualnie czytane książki.')),
                  ),
                  Visibility(
                    visible: state.booksReading.isNotEmpty,
                    child: SizedBox(
                      width: 200,
                      child: FloatingActionButton.small(
                        heroTag: null,
                        onPressed: () {
                          context
                              .read<BookCubit>()
                              .choosenList(state.booksReading);
                          Utils.biblioteczkaNavigator.currentState!
                              .pushNamed('/GridBookShelf');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text('Zobacz wszystkie'),
                            Icon(BiblioteczkaIcons.backArrowIcon)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: ElevatedButton(
                  onPressed: () => Utils.biblioteczkaNavigator.currentState!
                      .pushNamed('/addBook'),
                  child: const Icon(Icons.add)),
            )
          ]),
        );
      },
    );
  }
}
