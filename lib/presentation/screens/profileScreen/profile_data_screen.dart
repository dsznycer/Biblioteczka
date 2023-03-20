import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/Models/book_model.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/buttons.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChangeDataScreen extends StatelessWidget {
  ProfileChangeDataScreen({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
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
                      icon: const Icon(Icons.arrow_back)),
                  SizedBox(width: size.width / 4),
                  const Text(
                    'Twoje dane',
                    style: AppTextStyles.H3,
                  )
                ],
              ),
            ),
            SizedBox(
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
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Twoje imie:',
                                    style: AppTextStyles.TextLarge,
                                  ),
                                  Text(
                                    state.user.name,
                                    style: AppTextStyles.TextLarge,
                                  ),
                                  const Text(
                                    'Adress mailowy:',
                                    style: AppTextStyles.TextLarge,
                                  ),
                                  Text(
                                    state.user.email,
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
                        backgroundImage: NetworkImage(state.user.photo),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AppTextInput(
                      hintText: 'Imie',
                      controller: _nameController,
                      iconData: Icons.people_rounded,
                      onChanged: (string) => print(string)),
                  AppTextInput(
                      hintText: 'Mail',
                      iconData: Icons.mail,
                      onChanged: (string) => print(string)),
                  BasicButton(
                      func: () => context
                          .read<AuthCubit>()
                          .updateUserName(_nameController.text),
                      text: 'Zmień dane'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
