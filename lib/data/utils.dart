import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> mainNavigator = GlobalKey();
  static GlobalKey<NavigatorState> homeNavigator = GlobalKey();
  static GlobalKey<NavigatorState> biblioteczkaNavigator = GlobalKey();
  static GlobalKey<NavigatorState> profileNavigator = GlobalKey();

  static const String basicBookPhoto =
      'https://s2982.pcdn.co/wp-content/uploads/2019/01/The-Binding-by-Bridget-Collins-709x1024.jpg.optimal.jpg';

  static const Map<String, String> basicBookGoogle = {
    'thumbnail': basicBookPhoto
  };
}

enum BookProgress { red, toRead, inProgress }
