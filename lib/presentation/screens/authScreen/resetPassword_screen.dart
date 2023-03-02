import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/screens/authScreen/login_screen.dart';
import 'package:biblioteczka/presentation/screens/authScreen/widgets.dart';
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
        Container(
            height: size.height / 5,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.kCol3,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [AppShadows.Shad2]),
            child: Image.asset('assets/photo/logo-biblio.png')),
        const SizedBox(height: 30),
        // Box with login and password
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Column(
            children: [
              const Text(
                'Zresetuj hasło',
                style: AppTextStyles.Subtitle,
              ),
              LoginTextInput(
                  controller: email,
                  label: 'Adres email',
                  icon: const Icon(Icons.mail)),
              SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 10),
        LoginButton(
          func: () => context.read<AuthCubit>(),
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
