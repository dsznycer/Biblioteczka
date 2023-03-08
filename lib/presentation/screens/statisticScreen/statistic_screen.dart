import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
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
    Size size = MediaQuery.of(context).size;
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
                  // Appbar with title
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.kCol2.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    width: size.width,
                    height: size.height / 6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: size.width,
                          height: 60,
                          child: const Text(
                            'Twoje statystyki',
                            style: AppTextStyles.H2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(15),
                        child: Text(
                          'W tym roku przeczytałeś ${state.redInCurrentYear.length.toString()} książek.',
                          style: AppTextStyles.H4,
                        ),
                      ),
                      // SizedBox(
                      //   width: 250,
                      //   child: FloatingActionButton.small(
                      //       child: const Text('Minus'), onPressed: () {}),
                      // ),
                    ],
                  ),
                ]),
          );
        },
      ),
    );
  }
}
