import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/screens/authScreen/widgets.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Box with logo
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
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                const Text(
                  'Zaloguj się',
                  style: AppTextStyles.H3,
                ),
                LoginTextInput(
                    controller: email,
                    label: 'Adres email',
                    icon: const Icon(Icons.mail)),
                LoginTextInput(
                    controller: password,
                    obscureBool: true,
                    label: 'Hasło',
                    icon: const Icon(Icons.key)),
                const SizedBox(height: 20),
                const RowWithRegisterButton(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          LoginButton(
            func: () => context
                .read<AuthCubit>()
                .loginWithEmailPassword(email.text, password.text),
            label: 'Zaloguj się',
          ),
          LoginButton(
              func: () => Utils.authNavigator.currentState!
                  .pushReplacementNamed('/RegistrationScreen'),
              label: 'Załóż konto')
        ],
      ),
    );
  }
}

class RowWithRegisterButton extends StatelessWidget {
  const RowWithRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Zapomniałeś hasła?', style: AppTextStyles.TextMedium),
        InkWell(
          onTap: () => Utils.authNavigator.currentState!
              .pushReplacementNamed('/ResetPasswordScreen'),
          child: Text('Zresetuj je',
              style: AppTextStyles.TextMedium.copyWith(
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
