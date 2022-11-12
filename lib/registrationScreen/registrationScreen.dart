import 'package:flutter/material.dart';

class registrationScreen extends StatelessWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text('jebać')),
      ),
    );
  }
}
