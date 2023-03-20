import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_widgets.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenView extends StatelessWidget {
  ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "Twój profil" tile
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
                  const Expanded(
                    child: SizedBox(
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
            SizedBox(
              height: size.height / 4,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    left: size.width * 0.08,
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.15,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Twoje imie:',
                                    style: AppTextStyles.TextLarge,
                                  ),
                                  Text(
                                    state.user.name,
                                    style: AppTextStyles.TextLarge,
                                  ),
                                  const Text(
                                    'Adress mailowy:',
                                    style: AppTextStyles.TextLarge,
                                  ),
                                  Text(
                                    state.user.email,
                                    maxLines: 3,
                                    style: AppTextStyles.TextLarge,
                                  )
                                ]),
                          ),
                          const Expanded(
                            child: SizedBox(width: 2),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * 0.08,
                    child: Container(
                      width: size.width * 0.4,
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(state.user.photo),
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
                        child: Text('Ustawienia:', style: AppTextStyles.H3),
                      ),
                      Tile(
                          onTap: () => Utils.profileNavigator.currentState!
                              .pushNamed('/ChangeDataView'),
                          title: 'Twoje dane',
                          subtitle: 'Zmień swoje dane kontaktowe',
                          cIcon: Icons.person),
                      Tile(
                          onTap: () {
                            print(context.read<AuthCubit>().state.user);
                            print(context.read<AuthCubit>().userStr);
                          },
                          title: 'Powiadomienia',
                          subtitle: 'Zarządzaj swoimi powiadomieniami',
                          cIcon: Icons.notifications),
                      Tile(
                          onTap: () {
                            context.read<AuthCubit>().signOut();
                            context.read<SettingsCubit>().changeIndex(0);
                          },
                          title: 'Wyloguj',
                          subtitle: 'Wyloguj się z aplikacji',
                          cIcon: Icons.logout_outlined),
                      Tile(
                          onTap: () => _showDialogAccountDelete(context),
                          title: 'Usuń konto',
                          subtitle:
                              'Bezpowrotnie usuń swoje konto z wszystkim danymi',
                          cIcon: Icons.delete),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

void _showDialogAccountDelete(context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('Usunięcie konta'),
              content: const Text('Czy na pewno chcesz usunąć swoje konto?'),
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().deleteUser();
                        Navigator.of(context).pop();
                        context.read<SettingsCubit>().changeIndex(0);
                      },
                      child: Text(
                        'Usuń swoje konto',
                        style:
                            AppTextStyles.TextLarge.copyWith(color: Colors.red),
                      )),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Anuluj',
                        style: AppTextStyles.TextLarge,
                      )),
                )
              ]));
}
