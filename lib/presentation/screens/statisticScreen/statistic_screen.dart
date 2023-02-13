import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/APIs/google_books_api.dart';
import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          List<Book> bookList = state.booksRed
              .where((element) => element.yearOfEnd == '2023')
              .toList();

          return SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'W tym roku przeczytałeś:',
                    style: AppTextStyles.H2,
                    textAlign: TextAlign.center,
                  ),
                  Text("książek ${bookList.length.toString()}!"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
                  SizedBox(
                    width: 100,
                    child: FloatingActionButton.small(
                        child: Text('Get books/empty func'), onPressed: () {}),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
