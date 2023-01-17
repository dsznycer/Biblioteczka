import 'package:biblioteczka/presentation/screens/bookshelf_screen.dart';
import 'package:biblioteczka/presentation/screens/home_screen.dart';
import 'package:biblioteczka/presentation/screens/profile_screen.dart';
import 'package:biblioteczka/presentation/screens/registration/login_screen.dart';
import 'package:biblioteczka/presentation/screens/statistic_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case '0':
        page = HomeScreen();
        break;

      case '1':
        page = bookShelf();
        break;

      case '2':
        page = StatisticScreen();
        break;

      case '3':
        page = ProfileScreen();
        break;

      default:
        page = loginScreen();
    }
    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(microseconds: 0),
    );
  }
}
