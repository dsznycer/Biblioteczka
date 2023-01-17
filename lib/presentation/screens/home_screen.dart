import 'dart:ffi';

import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/book_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Book book = Book(title: 'chujestwo');
    return Scaffold(
        backgroundColor: Colors.brown,
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.status.toString()),
                Container(
                  width: 400,
                  height: 600,
                  child: ListView.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, int index) {
                        return BookWidget(
                          book: state.books[index] as Book,
                        );
                      }),
                ),
                IconButton(
                    onPressed: () => context.read<BookCubit>().addNewBook(book),
                    icon: Icon(
                      Icons.add,
                      color: Colors.blueAccent,
                    )),
                IconButton(
                    onPressed: () => context.read<BookCubit>().toInitial(),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.blueAccent,
                    ))
              ],
            );
          },
        ));
  }
}
