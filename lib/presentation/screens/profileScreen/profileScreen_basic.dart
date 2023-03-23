import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBasic extends StatelessWidget {
  const ProfileScreenBasic({super.key});

  @override
  Widget build(BuildContext context) {
    bool darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);
    return Scaffold(
        backgroundColor: darkMode ? AppColors.kCol5 : Colors.white,
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: Navigator(
          key: Utils.profileNavigator,
          onGenerateRoute:
              RepositoryProvider.of<AppRouter>(context).profileNavigator,
        ));
  }
}
