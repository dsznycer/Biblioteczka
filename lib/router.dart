import 'package:biblioteczka/presentation/screens/authScreen/auth_basic.dart';
import 'package:biblioteczka/presentation/screens/authScreen/login_screen.dart';
import 'package:biblioteczka/presentation/screens/authScreen/resetPassword_screen.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_addBook.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_addBookPhoto.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_basic.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_viewBook.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/bookshelf_screen.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/booshelf_gridBookShelf.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/homescreen_basic.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/homescreen_screen.dart';
import 'package:biblioteczka/presentation/screens/authScreen/registration_screen.dart';
import 'package:biblioteczka/presentation/screens/authScreen/loading_screen.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/homescreen_view_HapiApi_book.dart';
import 'package:biblioteczka/presentation/screens/homeScreen/homescreen_view_google_book.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profileScreen_basic.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_data_screen.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_notifications_screen.dart';
import 'package:biblioteczka/presentation/screens/profileScreen/profile_screen.dart';
import 'package:biblioteczka/presentation/screens/statisticScreen/statistic_screen.dart';
import 'package:biblioteczka/presentation/screens/bookShelfScreen/view_book_screen.dart';
import 'package:flutter/cupertino.dart';

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
        page = ProfileScreenBasic();
        break;

      case '/login':
        page = AuthBasic();
        break;

      default:
        page = AuthBasic();
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
        page = BookShelfScreen();
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
        page = BookShelfScreen();
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
      case '/ViewBook':
        page = ViewGoogleBook();
        break;
      case '/ViewBookApiModel':
        page = ViewBookApiModel();
        break;
      default:
        page = HomeScreen();
    }

    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(milliseconds: 0),
    );
  }

  Route profileNavigator(RouteSettings routeSettings) {
    Widget page;

    switch (routeSettings.name) {
      case '/ChangeDataView':
        page = ProfileChangeDataScreen();
        break;
      case '/ProfileScreenView':
        page = ProfileScreenView();
        break;
      case '/ChangeNotificationView':
        page = ProfileNotificationsView();
        break;
      default:
        page = ProfileScreenView();
    }

    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(seconds: 0),
      reverseTransitionDuration: const Duration(seconds: 0),
    );
  }

  Route authNavigator(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case '/Login':
        page = LoginScreen();
        break;
      case '/RegistrationScreen':
        page = RegistrationScreen();
        break;
      case '/ResetPasswordScreen':
        page = ResetPasswordScreen();
        break;
      case '/LoadingScreen':
        page = const LoadingScreen();
        break;
      default:
        page = LoginScreen();
    }

    return PageRouteBuilder(
      pageBuilder: ((_, __, ___) => page),
      transitionDuration: const Duration(seconds: 0),
      reverseTransitionDuration: const Duration(seconds: 0),
    );
  }
}
