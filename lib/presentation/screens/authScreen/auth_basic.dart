import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBasic extends StatelessWidget {
  const AuthBasic({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.authState == AuthStatus.authenticated) {
            Utils.mainNavigator.currentState!.pushReplacementNamed('/');
          }
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/photo/bookShop.png'),
          )),
          child: SafeArea(
            child: Navigator(
              key: Utils.authNavigator,
              onGenerateRoute:
                  RepositoryProvider.of<AppRouter>(context).authNavigator,
            ),
          ),
        ),
      ),
    );
  }
}
