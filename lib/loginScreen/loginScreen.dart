import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Keep track of your book adventure.'),
              SizedBox(height: 30),
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
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    print(_auth.currentUser!.email);
                    if (_auth.currentUser!.email != null) {
                      Navigator.pushNamed(context, 'bookshelfScreen');
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('registrationScreen');
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: Colors.blueAccent,
                  child: Center(child: Text('Zarejestruj się')),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _auth.sendPasswordResetEmail(email: email);
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: Colors.black26,
                  child: Center(child: Text('Zresetuj hasło')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
