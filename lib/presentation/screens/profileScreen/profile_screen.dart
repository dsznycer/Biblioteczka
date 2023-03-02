import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);

    return Scaffold(
        backgroundColor: darkMode ? AppColors.kCol5 : Colors.white,
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 60,
                      child: Text(
                        'Twój profil',
                        style: AppTextStyles.H2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/photo/biblio-sygnet-kadrowany.png',
                        height: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height / 4,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    left: 40,
                    child: Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dominik Sznycer',
                              style: AppTextStyles.TextMedium,
                            )
                          ]),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage:
                            const AssetImage('assets/photo/profile_pick.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Dane konta:', style: AppTextStyles.H3),
                      ),
                      for (int i = 0; i < 3; i++)
                        Tile(
                            onTap: () => print('Box ${i}'),
                            title: 'Box number ${i}',
                            subtitle: 'subtitle ${i}',
                            cIcon: BiblioteczkaIcons.bookIcon),
                      Tile(
                          onTap: () => print(context.read<AuthCubit>().userStr),
                          title: 'Wydrukuj użytkownika',
                          subtitle: 'subtitle',
                          cIcon: Icons.fitbit_outlined),
                      Tile(
                          onTap: () {
                            context.read<AuthCubit>().signOut();
                          },
                          title: 'Wyloguj',
                          subtitle: 'Wyloguj się z aplikacji',
                          cIcon: Icons.logout),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {required this.onTap,
      required this.title,
      required this.subtitle,
      required this.cIcon,
      super.key});

  final String title;
  final String subtitle;
  final IconData cIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.kCol2op50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [AppShadows.Shad1]),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(cIcon))),
          const SizedBox(width: 15),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), Text(subtitle)],
            ),
          )
        ]),
      ),
    );
  }
}
