import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_shadows.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
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

class AccountInfoAndPhoto extends StatelessWidget {
  const AccountInfoAndPhoto({
    required this.size,
    required this.userName,
    required this.userMail,
    required this.userPhoto,
    required this.function,
    super.key,
  });

  final Size size;
  final String userName;
  final String userMail;
  final String userPhoto;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: size.width * 0.08,
            child: Container(
              width: size.width * 0.7,
              height: size.height * 0.15,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  boxShadow: const [AppShadows.Shad2],
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Twoje imie:',
                            style: AppTextStyles.TextLarge,
                          ),
                          Text(
                            userName,
                            style: AppTextStyles.TextLarge,
                          ),
                          const Text(
                            'Adress mailowy:',
                            style: AppTextStyles.TextLarge,
                          ),
                          Text(
                            userMail,
                            maxLines: 3,
                            style: AppTextStyles.TextLarge,
                          )
                        ]),
                  ),
                  const Expanded(
                    child: SizedBox(width: 2),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: size.width * 0.08,
            child: Container(
              width: size.width * 0.4,
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(userPhoto),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 60,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: IconButton(
                onPressed: function,
                icon: const Icon(Icons.photo),
                iconSize: 30,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
