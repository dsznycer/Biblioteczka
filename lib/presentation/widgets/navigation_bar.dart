import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/utils.dart';

Map<int, String> routesMap = {
  0: '/',
  1: '/Biblioteczka',
  2: '/StatisticScreen',
  3: '/ProfileScreen',
};

class Navig extends StatefulWidget {
  const Navig({super.key});

  @override
  State<Navig> createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return NavigationBar(
            onDestinationSelected: (value) {
              context.read<BookCubit>().addIndex(value);
              Utils.mainNavigator.currentState!.pushNamed(routesMap[value]!);
            },
            selectedIndex: state.index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            animationDuration: Duration(seconds: 1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.reset_tv_rounded), label: 'Home Screen'),
              NavigationDestination(
                  icon: Icon(Icons.book), label: 'Biblioteczka'),
              NavigationDestination(
                  icon: Icon(Icons.reset_tv_rounded), label: 'Statystyki'),
              NavigationDestination(
                  icon: Icon(Icons.access_alarm), label: 'Profil')
            ]);
      },
    );
  }
}
