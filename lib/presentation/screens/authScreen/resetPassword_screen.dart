import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/screens/authScreen/login_screen.dart';
import 'package:biblioteczka/presentation/screens/authScreen/widgets_authScreen.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        BoxWithBiblioLogo(size: size),
        // Box with login and password
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            children: [
              const Text(
                'Zresetuj hasło',
                style: AppTextStyles.H3,
              ),
              LoginTextInput(
                  controller: email,
                  label: 'Adres email',
                  icon: const Icon(Icons.mail)),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 10),
        LoginButton(
          func: () => context.read<AuthCubit>().resetPasswordEmail(email.text),
          label: 'Zresetuj hasło',
        ),
        LoginButton(
            func: () => Utils.authNavigator.currentState!
                .pushReplacementNamed('/Login'),
            label: 'Wróc do logowania')
      ],
    );
  }
}
