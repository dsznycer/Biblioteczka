import 'package:biblioteczka/presentation/screens/bookshelfScreen.dart';
import 'package:biblioteczka/presentation/screens/loginScreen.dart';
import 'package:biblioteczka/presentation/screens/profileScreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (context) => bookShelf());
        }
        break;

      case '/profileScreen':
        {
          return MaterialPageRoute(builder: (context) => profileScreen());
        }
        break;

      default:
        return MaterialPageRoute(builder: (context) => loginScreen());
    }
  }
}
