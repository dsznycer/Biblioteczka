import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBasic extends StatelessWidget {
  const ProfileScreenBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);
    return const Scaffold();
  }
}
