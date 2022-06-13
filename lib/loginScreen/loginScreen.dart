import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(),
              TextField(),
              GestureDetector(
                onTap: () {
                  db.collection('log').add({'gruby': Timestamp.now()});
                  Navigator.pushNamed(context, 'bookshelfScreen');
                },
                child: Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
