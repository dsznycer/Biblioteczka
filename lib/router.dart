import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_addBook.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_addBookPhoto.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_viewBook.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshlef_basic.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_screen.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/booshelf_gridBookShelf.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/homescreen_basic.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/homescreen_screen.dart';
import 'package:biblioteczka/presentation/screens/loginScreen/login_screen.dart';
import 'package:biblioteczka/presentation/screens/loginScreen/registration_screen.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_screen.dart';

import 'package:biblioteczka/presentation/screens/statisticScreen/statistic_screen.dart';
import 'package:biblioteczka/presentation/screens/view_book_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route mainNavigator(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case '/':
        page = const HomeScreenBasic();
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

      case '/RegistrationScreen':
        page = RegistrationScreen();
        break;

      case '/login':
        page = LoginScreen();
        break;

      default:
        page = LoginScreen();
    }
    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(microseconds: 0),
    );
  }

  Route biblioteczkaNavigator(RouteSettings routeSettings) {
    Widget page;
    int miliseconds;
    switch (routeSettings.name) {
      case '/':
        page = BookShelf();
        miliseconds = 0;
        break;
      case '/addBook':
        page = BookAdd();
        miliseconds = 0;
        break;
      case '/viewBook':
        page = const BookshelfViewBook();
        miliseconds = 500;
        break;
      case '/addBookPhoto':
        page = const AddBookPhoto();
        miliseconds = 500;
        break;
      case '/GridBookShelf':
        page = const GridBookShelf();
        miliseconds = 0;
        break;

      default:
        page = BookShelf();
        miliseconds = 0;
    }
    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: Duration(milliseconds: miliseconds),
      // reverseTransitionDuration: const Duration(seconds: 0),
    );
  }

  Route homeNavigator(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case '/':
        page = HomeScreen();
        break;
      case '/viewBook':
        page = ViewBook();
        break;
      default:
        page = HomeScreen();
    }

    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}
