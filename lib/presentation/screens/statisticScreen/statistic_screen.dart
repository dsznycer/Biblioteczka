import 'dart:math';
import 'package:biblioteczka/business_logic/bloc/challenge_bloc.dart';
import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/Models/ChallangesModels/challenges_model.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticScreen extends StatelessWidget {
  StatisticScreen({super.key});

  @override
  Widget build(context) {
    final darkMode =
        context.select((SettingsCubit bloc) => bloc.state.darkMode);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkMode == true ? AppColors.kCol5 : Colors.white,
      bottomNavigationBar: RepositoryProvider.of<Navig>(context),
      body: Builder(builder: (context) {
        final bookState = context.watch<BookCubit>().state;
        final challengeState = context.watch<ChallengeBloc>().state;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatisticTile(
                      text: 'W tym roku przeczytałeś',
                      value: bookState.redInCurrentYear.length.toString(),
                    ),
                    StatisticTile(
                        text: 'Aktualnie czytasz',
                        value: bookState.booksReading.length.toString()),
                    const SizedBox(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        'Wybierz wyzwanie:',
                        style: AppTextStyles.H3,
                      )),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < 3; i++)
                        GestureDetector(
                            onTap: () => context.read<ChallengeBloc>().add(
                                AddChallenge(
                                    item: challengeState.challengeOne)),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Przeczytaj 12 książek w tym roku!'),
                                  Icon(Icons.add),
                                ],
                              ),
                            ))
                    ],
                  ),
                ),
                const Center(
                    child: Text('Lista wyzwań:', style: AppTextStyles.H3)),
                const ChallengesSection(),
              ]),
        );
      }),
    );
  }
}

class ChallengesSection extends StatelessWidget {
  const ChallengesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengeBloc, ChallengeState>(
      builder: (context, state) {
        if (state.listOfChallenges.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.listOfChallenges.length,
                itemBuilder: ((context, index) => ChallengeTile(
                      func: () => context
                          .read<ChallengeBloc>()
                          .add(RemoveChallenge(indexOfRemoved: index)),
                      item: state.listOfChallenges[index],
                      actuallValue: state.listOfChallenges.length,
                    ))),
          );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Na razie nie masz żadnych wyzwań. \n Dodaj jakieś z powyższej listy!',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }
}

class ChallengeTile extends StatelessWidget {
  const ChallengeTile(
      {this.func, required this.item, required this.actuallValue, super.key});

  final ChallengeItem item;
  final int actuallValue;
  final void Function()? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 280,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kCol2op50,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(onPressed: func, icon: const Icon(Icons.close)),
        Text(item.name),
        Text(item.description),
        Text("Do przeczytania zostało Ci: ${item.booksToRead - actuallValue}")
      ]),
    );
  }
}

class StatisticTile extends StatelessWidget {
  StatisticTile({
    required this.text,
    required this.value,
    super.key,
  });

  final String text;
  final String value;
  final number = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.teal[number.nextInt(10) * 100],
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      child: Text(
        text + ' ' + value + ' książek',
        style: AppTextStyles.H4,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}
