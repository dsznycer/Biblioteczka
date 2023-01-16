import 'package:biblioteczka/presentation/screens/profile_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'loading_screen.dart';

class bookShelf extends StatelessWidget {
  bookShelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      bottomNavigationBar:
          NavigationBar(destinations: [startScreen(), profileScreen()]),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  width: 200,
                  height: 200,
                ),
                // ListView(
                //   children: [],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
