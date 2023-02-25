import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/APIs/google_books_api.dart';
import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(context) {
    final darkMode =
        context.select((SettingsCubit bloc) => bloc.state.darkMode);
    return Scaffold(
      backgroundColor: darkMode == true ? AppColors.kCol5 : Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Statystki czytacza: \n ${state.redInCurrentYear.length.toString()} książek!',
                    style: AppTextStyles.H2,
                    textAlign: TextAlign.center,
                  ),
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
