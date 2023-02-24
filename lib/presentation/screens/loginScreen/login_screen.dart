import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/photo/bookShop.png'),
        )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: size.height / 5,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.kCol3,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset('assets/photo/logo-biblio.png')),
              const SizedBox(height: 30),
              Container(
                height: size.height / 5,
                width: size.width - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                      ),
                    ),
                    Container(
                        height: 80,
                        width: 250,
                        child: TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.key),
                          ),
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    print(_auth.currentUser!.email);
                    if (_auth.currentUser!.email != null) {
                      Navigator.pushNamed(context, '0');
                    } else {
                      // TODO: show dialog wrong password or email
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  width: 150,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Center(child: Text('Zaloguj się')),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Utils.mainNavigator.currentState!
                      .pushReplacementNamed('/RegistrationScreen');
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: Colors.blueAccent,
                  child: Center(child: Text('Zarejestruj się')),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _auth.sendPasswordResetEmail(email: email);
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: AppColors.kCol2,
                  child: Center(child: Text('Zresetuj hasło')),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Utils.mainNavigator.currentState!
                      .pushReplacementNamed('/Biblioteczka');
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: AppColors.kCol2,
                  child: const Center(child: Text('Biblio screen')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextInput extends StatelessWidget {
  const LoginTextInput({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
      ),
    );
  }
}
