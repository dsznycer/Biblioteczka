import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book_model.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          List<Book> bookList = state.books
              .where((element) => element.yearOfEnd == '2023')
              .toList();

          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(child: Text('W tym roku przeczytałeś:')),
            Text(bookList.length.toString()),
          ]);
        },
      ),
    );
  }
}
