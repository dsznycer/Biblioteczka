import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/screens/authScreen/widgets.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
        // Box with login data
        Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                const Text(
                  'Stwórz konto w biblioteczce',
                  style: AppTextStyles.H3,
                ),
                LoginTextInput(
                    controller: email,
                    label: 'Adres email',
                    icon: const Icon(Icons.mail)),
                LoginTextInput(
                    controller: password,
                    label: 'Twoje hasło',
                    icon: const Icon(Icons.key),
                    obscureBool: true),
              ],
            )),
        const SizedBox(height: 20),
        LoginButton(
            func: () => context.read<AuthCubit>().createAccountLoginPassword(
                email.text.trim(), password.text.trim()),
            label: 'Stwórz konto'),
        LoginButton(
            func: () => Utils.authNavigator.currentState!
                .pushReplacementNamed('/Login'),
            label: 'Wróc do logowania')
      ],
    );
  }
}
