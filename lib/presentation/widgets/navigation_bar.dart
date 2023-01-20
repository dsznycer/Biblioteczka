import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/utils.dart';

Map<int, String> routesMap = {
  0: '/',
  1: '/Biblioteczka',
  2: '/StatisticScreen',
  3: '/ProfileScreen',
};

class Navig extends StatelessWidget {
  const Navig({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15), right: Radius.circular(18)),
          child: NavigationBar(
              onDestinationSelected: (value) {
                context.read<SettingsCubit>().changeIndex(value);
                Utils.mainNavigator.currentState!
                    .popAndPushNamed(routesMap[value]!);
              },
              selectedIndex: state.index,
              backgroundColor:
                  state.darkMode ? AppColors.kCol1 : Colors.blueGrey,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              animationDuration: const Duration(seconds: 1),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.reset_tv_rounded), label: 'Home Screen'),
                NavigationDestination(
                    icon: Icon(Icons.book), label: 'Biblioteczka'),
                NavigationDestination(
                    icon: Icon(Icons.reset_tv_rounded), label: 'Statystyki'),
                NavigationDestination(
                    icon: Icon(Icons.access_alarm), label: 'Profil')
              ]),
        );
      },
    );
  }
}
