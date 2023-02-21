import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';
  UserCredential? _userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close)),
              ),
              Container(
                height: 80,
                width: 250,
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                  ),
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
              GestureDetector(
                onTap: () async {
                  try {
                    _userCredential =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (_userCredential!.user != null) {
                      Navigator.pushNamed(context, 'bookshelfScreen');
                    }
                  } catch (e) {
                    print(e);
                  }
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    print(_auth.currentUser!.email);
                    if (_auth.currentUser!.email != null) {
                      Navigator.pushNamed(context, 'bookshelfScreen');
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
                  child: const Center(child: Text('Zarejestruj się')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
