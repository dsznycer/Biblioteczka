import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/navigation_bar.dart';

class BookShelfBasic extends StatelessWidget {
  BookShelfBasic({super.key});

  final HeroController _heroController = HeroController();

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);
    return Scaffold(
        backgroundColor: darkMode ? AppColors.kCol5 : Colors.white,
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: Navigator(
          observers: [_heroController],
          key: Utils.biblioteczkaNavigator,
          initialRoute: '/',
          onGenerateRoute:
              RepositoryProvider.of<AppRouter>(context).biblioteczkaNavigator,
        ));
  }
}
