import 'dart:ffi';

import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/book_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.withOpacity(0.9),
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Aktualnie czytasz:',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                width: 400,
                height: 300,
                child: state.status != BookStatus.initial
                    ? BookWidget(book: state.books.last as Book)
                    : Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator()),
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: () => context.read<BookCubit>().addNewBook(
                            Book(title: Timestamp.now().toString())),
                        icon: Icon(
                          Icons.add,
                          color: Colors.blueAccent,
                        )),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () => context.read<BookCubit>().toInitial(),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blueAccent,
                        )),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
