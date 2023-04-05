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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 4; i++)
                      IconButton(
                          onPressed: () => context.read<ChallengeBloc>().add(
                              AddChallenge(item: challengeState.challengeOne)),
                          icon: Icon(Icons.add))
                  ],
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
        return Column(
          children: [
            if (state.listOfChallenges.isNotEmpty)
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: state.listOfChallenges.length,
                    itemBuilder: ((context, index) => ChallengeTile(
                          item: state.listOfChallenges[index],
                          actuallValue: 2,
                        ))),
              )
          ],
        );
      },
    );
  }
}

class ChallengeTile extends StatelessWidget {
  const ChallengeTile(
      {required this.item, required this.actuallValue, super.key});

  final ChallengeItem item;
  final int actuallValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 340,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kCol2op50,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(item.name),
        Text(item.description),
        Text("Do przeczytania zostało Ci: ${item.booksread - actuallValue}")
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
