import 'package:flutter/material.dart';

class AppShadows {
  static const BoxShadow Shad1 =
      BoxShadow(color: Colors.black26, offset: Offset(3, 1), blurRadius: 4);

  static const BoxShadow Shad2 = BoxShadow(
      color: Color.fromARGB(77, 172, 183, 183),
      offset: Offset(0, 5),
      blurRadius: 10);

  static const BoxShadow Shad3 =
      BoxShadow(color: Color(0x66232323), offset: Offset(0, 5), blurRadius: 10);

  static const BoxShadow Shad4 =
      BoxShadow(color: Colors.black26, offset: Offset(0, 20), blurRadius: 30);
}
