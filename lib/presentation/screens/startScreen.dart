import 'package:biblioteczka/presentation/screens/bookshelfScreen.dart';
import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, "bookshelfScreen"),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amberAccent,
              )),
          Text('Witamy Witamy'),
        ],
      )),
    );
  }
}
