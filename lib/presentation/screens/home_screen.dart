import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/APIs/HapiBooks_api.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:biblioteczka/presentation/widgets/small_book_widget.dart';
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
    List<BookApi> apiList = [
      BookApi(
          name: 'Zero to one',
          category: 'Author nr 1',
          cover: 'https://ecsmedia.pl/c/bracia-karamazow-w-iext121646629.jpg'),
      BookApi(
          name: 'Lean Startup',
          category: 'Author nr 2',
          cover: 'https://ecsmedia.pl/c/bracia-karamazow-w-iext121646629.jpg'),
      BookApi(
          name: 'Brothers Karamazow',
          category: 'Author nr 2',
          cover: 'https://ecsmedia.pl/c/bracia-karamazow-w-iext121646629.jpg'),
    ];

    return Scaffold(
      backgroundColor: mode == true ? Colors.grey : Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: SwitchListTile(
                            activeColor: Colors.black26,
                            value: mode,
                            onChanged: (value) => context
                                .read<SettingsCubit>()
                                .changeDarkMode(value)),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/photo/profile_pick.jpg'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
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
                              ? BookWidget(book: state.booksRed.last)
                              : CircularProgressIndicator.adaptive(),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () async {
                                    BookApi bookApi = await context
                                        .read<HapiBooksApi>()
                                        .getBook();
                                    apiList.add(bookApi);
                                  },
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
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Polecane:',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          height: 250,
                          child: ListView.builder(
                              itemCount: apiList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return SmallBookWidget(
                                  bookAPi: apiList[index],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
