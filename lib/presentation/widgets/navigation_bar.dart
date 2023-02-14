import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/utils.dart';

class Navig extends StatelessWidget {
  Navig({super.key});

  Map<int, String> routesMap = {
    0: '/',
    1: '/Biblioteczka',
    2: '/StatisticScreen',
    3: '/ProfileScreen',
  };

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
                    .pushReplacementNamed(routesMap[value]!);
              },
              elevation: 6,
              selectedIndex: state.index,
              backgroundColor:
                  state.darkMode ? AppColors.kCol1 : Colors.white70,
              animationDuration: const Duration(seconds: 1),
              destinations: const [
                NavigationDestination(
                    selectedIcon: Icon(BiblioteczkaIcons.homeIcon,
                        color: AppColors.kCol2),
                    icon: Icon(BiblioteczkaIcons.homeIcon),
                    label: 'Home'),
                NavigationDestination(
                    selectedIcon: Icon(BiblioteczkaIcons.biblioIcon,
                        color: AppColors.kCol2),
                    icon: Icon(BiblioteczkaIcons.biblioIcon),
                    label: 'Biblioteczka'),
                NavigationDestination(
                    selectedIcon: Icon(BiblioteczkaIcons.chartIcon,
                        color: AppColors.kCol2),
                    icon: Icon(BiblioteczkaIcons.chartIcon),
                    label: 'Statystyki'),
                NavigationDestination(
                  selectedIcon: Icon(BiblioteczkaIcons.settingsIcon,
                      color: AppColors.kCol2),
                  icon: Icon(BiblioteczkaIcons.settingsIcon),
                  label: 'Profil',
                )
              ]),
        );
      },
    );
  }
}
