import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_style.dart';

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
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 180,
        height: 45,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          label,
          style: AppTextStyles.TextLarge,
        )),
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
