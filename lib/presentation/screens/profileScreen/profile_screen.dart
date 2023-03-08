import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool darkMode =
        context.select((SettingsCubit cubit) => cubit.state.darkMode);

    return Scaffold(
        backgroundColor: darkMode ? AppColors.kCol5 : Colors.white,
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
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
                                  state.user.name,
                                  style: AppTextStyles.TextMedium,
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 90,
                            backgroundImage: const AssetImage(
                                'assets/photo/profile_pick.jpg'),
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
                          TextField(
                            controller: name,
                          ),
                          Tile(
                              onTap: () => context
                                  .read<AuthCubit>()
                                  .updateUserName(name.text),
                              title: 'Update name',
                              subtitle: 'subtitle',
                              cIcon: Icons.near_me),
                          Tile(
                              onTap: () {
                                print(context.read<AuthCubit>().userStr);
                              },
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
  final void Function() onTap;

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
                      },
                      child: Text(
                        'Usuń swoje konto.',
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
                        'Nie chce usuwać konta',
                        style: AppTextStyles.TextLarge,
                      )),
                )
              ]));
}
