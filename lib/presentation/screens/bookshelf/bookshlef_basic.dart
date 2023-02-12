import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/widgets/book_widget.dart';
import 'package:biblioteczka/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/book_cubit.dart';
import '../../../data/models/book_model.dart';
import '../../widgets/navigation_bar.dart';

class BookShelfBasic extends StatelessWidget {
  const BookShelfBasic({super.key});

  static HeroController _heroController = HeroController();

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
