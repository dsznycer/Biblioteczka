import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/Models/book_model.dart';
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
        if (previous.booksRed.length < current.booksRed.length) {
          messageOfSnackBar = snackBarInfo['+']!;
          return true;
        } else if (previous.booksRed.length > current.booksRed.length) {
          messageOfSnackBar = snackBarInfo['-']!;
          return true;
        }
        return false;
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Biblioteczka',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Przeczytane w tym roku:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    width: _size.width,
                    height: 280,
                    child: state.booksRed.isEmpty
                        ? const Center(
                            child: Text(
                                'Tu pojawia się przeczytane w tym roku książki.'),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.booksRed.length,
                            itemBuilder: (context, int index) {
                              return BookWidget(
                                  book: state.booksRed[index],
                                  onTap: () {
                                    context
                                        .read<SettingsCubit>()
                                        .choosenBook(state.booksRed[index]);
                                    Utils.biblioteczkaNavigator.currentState!
                                        .pushNamed('/editBook');
                                  });
                            }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () =>
                              context.read<BookCubit>().addNewBookToRed(
                                    Book(
                                        title: 'Created on biblio screen',
                                        author: 'test',
                                        yearOfEnd: '2023',
                                        pages: '23',
                                        notes: ['notes'],
                                        bookProgress: BookProgress.inProgress,
                                        score: 2),
                                  ),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.blueAccent,
                          )),
                      IconButton(
                          onPressed: () =>
                              context.read<BookCubit>().removeLastBooksRed(),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Do przeczytania:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                      width: 400,
                      height: 300,
                      child: state.booksToRead.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.booksToRead.length,
                              itemBuilder: (context, int index) {
                                return BookWidget(
                                    book: state.booksToRead[index],
                                    onTap: () {
                                      context.read<SettingsCubit>().choosenBook(
                                          state.booksToRead[index]);
                                      Utils.biblioteczkaNavigator.currentState!
                                          .pushNamed('/editBook');
                                    });
                              })
                          : Center(
                              child: const Text(
                                  'Tutaj pojawią się książki, które chcesz przeczytać!'),
                            )),
                  IconButton(
                      onPressed: () =>
                          context.read<BookCubit>().removeLastBooksToRed(),
                      icon: Icon(BiblioteczkaIcons.deleteIcon))
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: ElevatedButton(
                  onPressed: () => Utils.biblioteczkaNavigator.currentState!
                      .pushNamed('/addBook'),
                  child: Icon(Icons.add)),
            )
          ]),
        );
      },
    );
  }
}
