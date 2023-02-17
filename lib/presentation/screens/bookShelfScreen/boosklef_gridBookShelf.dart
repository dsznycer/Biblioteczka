import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridBookShelf extends StatelessWidget {
  const GridBookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Text('Twoje książki do przeczytania'),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: state.booksRed.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      print(index);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(state.booksRed[index].urlPhoto),
                    ),
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
