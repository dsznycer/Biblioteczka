import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class tempScreen extends StatelessWidget {
  final String tekst;

  const tempScreen({this.tekst = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          tekst,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
