import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/book_widget.dart';

class BookShelf extends StatelessWidget {
  BookShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {Utils.biblioteczkaNavigator.currentState!.pushNamed('/addBook')},
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return SafeArea(
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  width: 400,
                  height: 300,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.books.length,
                      itemBuilder: (context, int index) {
                        return BookWidget(book: state.books[index]);
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () => context.read<BookCubit>().addNewBook(
                            Book(title: 'Created on biblioteczka screen')),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                        )),
                    IconButton(
                        onPressed: () => context.read<BookCubit>().removeLast(),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blueAccent,
                        ))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
