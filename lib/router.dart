import 'package:biblioteczka/presentation/screens/bookshelf/bookshelf_addBook.dart';
import 'package:biblioteczka/presentation/screens/bookshelf/bookshelf_viewBook.dart';
import 'package:biblioteczka/presentation/screens/bookshelf/bookshlef_basic.dart';
import 'package:biblioteczka/presentation/screens/bookshelf/bookshelf_screen.dart';
import 'package:biblioteczka/presentation/screens/home_screen.dart';
import 'package:biblioteczka/presentation/screens/profile_screen.dart';
import 'package:biblioteczka/presentation/screens/registration/login_screen.dart';
import 'package:biblioteczka/presentation/screens/statistic_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route mainNavigator(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case '/':
        page = HomeScreen();
        break;

      case '/Biblioteczka':
        page = BookShelfBasic();
        break;

      case '/StatisticScreen':
        page = StatisticScreen();
        break;

      case '/ProfileScreen':
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

  Route biblioteczkaNavigator(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case '/':
        page = BookShelf();
        break;
      case '/addBook':
        page = const BookAdd();
        break;
      case '/editBook':
        page = BookshelfViewBook();
        break;

      default:
        page = BookShelf();
    }
    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}
