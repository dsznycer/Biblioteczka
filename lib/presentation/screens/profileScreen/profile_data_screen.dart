import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_widgets.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/buttons.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChangeDataScreen extends StatelessWidget {
  ProfileChangeDataScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
              showCloseIcon: true,
              duration: const Duration(seconds: 3),
              content: Text(state.errorMessage)));
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                height: size.height / 7,
                decoration: BoxDecoration(
                    color: AppColors.kCol2.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () =>
                            Utils.profileNavigator.currentState!.pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        )),
                    SizedBox(width: size.width / 4),
                    const Text(
                      'Twoje dane',
                      style: AppTextStyles.H3,
                    )
                  ],
                ),
              ),
              AccountInfoAndPhoto(
                size: size,
                userName: state.user.name,
                userMail: state.user.email,
                userPhoto: state.user.photo,
                function: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    AppTextInput(
                        hintText: 'Imie',
                        controller: _nameController,
                        iconData: Icons.people_rounded,
                        onChanged: (string) => () {}),
                    BasicButton(
                        func: () {
                          context
                              .read<AuthCubit>()
                              .updateUserName(_nameController.text);
                          _nameController.clear();
                        },
                        text: 'Zmień swoje imie'),
                    AppTextInput(
                        hintText: 'Mail',
                        iconData: Icons.mail,
                        onChanged: (string) => () {}),
                    BasicButton(
                        func: () {
                          context
                              .read<AuthCubit>()
                              .updateUserEmailAddress(_mailController.text);
                          _mailController.clear();
                        },
                        text: 'Zmień adres email'),
                    AppTextInput(
                        hintText: 'Hasło',
                        obscureText: true,
                        iconData: Icons.key,
                        onChanged: (string) => () {}),
                    BasicButton(
                        func: () {
                          context
                              .read<AuthCubit>()
                              .updateUserPassword(_passwordController.text);
                          _passwordController.clear();
                        },
                        text: 'Zmień hasło'),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
