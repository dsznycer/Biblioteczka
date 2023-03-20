import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:flutter/material.dart';

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
