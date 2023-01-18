import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_widget.dart';

class BookShelf extends StatelessWidget {
  BookShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Biblioteczka',
                  style: TextStyle(fontSize: 30),
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
              IconButton(
                  onPressed: () => context.read<BookCubit>().addNewBook(Book()),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blueAccent,
                  )),
              IconButton(
                  onPressed: () => context.read<BookCubit>().toInitial(),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.blueAccent,
                  ))
            ],
          );
        },
      ),
    );
  }
}
