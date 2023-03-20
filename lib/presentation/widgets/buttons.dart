import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    required this.func,
    required this.text,
    this.icon,
    super.key,
  });
  final void Function() func;
  final String text;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, bottom: 5, top: 5),
      child: FloatingActionButton.extended(
        heroTag: null,
        backgroundColor: AppColors.kCol3,
        focusColor: AppColors.kCol2,
        onPressed: func,
        label: Text(text),
        icon: icon,
      ),
    );
  }
}
