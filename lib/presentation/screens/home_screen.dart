import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/models/book_api_model.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
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
    final mode = context.select((SettingsCubit s) => s.state.darkMode);
    return Scaffold(
      backgroundColor: mode == true ? Colors.grey : Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoSwitch(
                            value: mode,
                            onChanged: (value) => context
                                .read<SettingsCubit>()
                                .changeDarkMode(value)),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/photo/profile_pick.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Aktualnie czytasz:',
                      style: AppTextStyles.H1,
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 300,
                    child: state.status != BookStatus.initial
                        ? BookWidget(book: state.books.last)
                        : CircularProgressIndicator.adaptive(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: IconButton(
                            onPressed: () => context
                                .read<BookCubit>()
                                .addNewBook(
                                    Book(title: Timestamp.now().toString())),
                            icon: Icon(
                              Icons.add,
                              color: AppColors.kCol2,
                            )),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () =>
                                context.read<BookCubit>().toInitial(),
                            icon: Icon(
                              Icons.delete,
                              color: AppColors.kCol2,
                            )),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Podobne:',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Center(
                    child: IconButton(
                        onPressed: () {
                          final jasonBook = BookApi(
                                  Timestamp.now().seconds.toInt(),
                                  title: 'Bracia karamazow',
                                  author: 'Dostojewski')
                              .toJson();

                          print(mode.toString());
                        },
                        icon: Icon(BiblioteczkaIcons.biblioIcon,
                            color: AppColors.kCol2, size: 49)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
