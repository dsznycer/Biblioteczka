import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          // final mode = context.select((SettingsCubit s) => s.state.darkMode);
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoSwitch(
                          value: false,
                          onChanged: (value) => context
                              .read<SettingsCubit>()
                              .changeDarkMode(value)),
                      CircularProgressIndicator.adaptive()
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Aktualnie czytasz:',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  width: 400,
                  height: 300,
                  child: state.status == BookStatus.withData
                      ? BookWidget(book: state.books.last as Book)
                      : CircularProgressIndicator.adaptive(),
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
                          onPressed: () =>
                              context.read<BookCubit>().toInitial(),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.blueAccent,
                          )),
                    )
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
