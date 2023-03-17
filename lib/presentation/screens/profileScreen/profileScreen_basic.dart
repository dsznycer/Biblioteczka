import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBasic extends StatelessWidget {
  const ProfileScreenBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);
    return Scaffold(
      backgroundColor: darkMode ? AppColors.kCol5 : Colors.white,
      body: Navigator(
        onGenerateRoute: context.read<AppRouter>().profileNavigator,
      ),
    );
  }
}
