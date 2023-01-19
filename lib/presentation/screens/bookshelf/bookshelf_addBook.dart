import 'dart:ffi';

import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BookAdd extends StatelessWidget {
  const BookAdd({super.key});

  @override
  Widget build(BuildContext context) {
    String name;
    String title;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dodaj ksiązkę'),
            MaterialButton(
              color: AppColors.kCol3,
              onPressed: () {
                Utils.biblioteczkaNavigator.currentState!.pop();
              },
              child: Text('Dodaj do biblioteczki'),
            )
          ],
        ),
      ),
    );
  }
}
