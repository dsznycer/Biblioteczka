import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_addBook.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_addBookPhoto.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_viewBook.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshlef_basic.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_screen.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/home_screen.dart';
import 'package:biblioteczka/presentation/screens/loginScreen/login_screen.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_screen.dart';

import 'package:biblioteczka/presentation/screens/statisticScreen/statistic_screen.dart';

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
        page = BookAdd();
        break;
      case '/editBook':
        page = const BookshelfViewBook();
        break;
      case '/addBookPhoto':
        page = const AddBookPhoto();
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
