import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_style.dart';

class BoxWithBiblioLogo extends StatelessWidget {
  const BoxWithBiblioLogo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height / 5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.kCol5,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [AppShadows.Shad2]),
        child: Image.asset('assets/photo/logo-biblio.png'));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {required this.func,
      required this.label,
      this.color = AppColors.kCol3,
      super.key});
  final void Function() func;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      height: 45,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: func,
          child: Center(
              child: Text(
            label,
            style: AppTextStyles.TextLarge,
          )),
        ),
      ),
    );
  }
}

class LoginTextInput extends StatelessWidget {
  const LoginTextInput(
      {required this.controller,
      required this.label,
      required this.icon,
      this.obscureBool = false,
      super.key});

  final TextEditingController controller;
  final Icon icon;
  final bool obscureBool;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 80,
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        obscureText: obscureBool,
        decoration: InputDecoration(icon: icon, helperText: label),
      ),
    );
  }
}
