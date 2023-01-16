import 'package:biblioteczka/presentation/screens/bookshelf_screen.dart';
import 'package:biblioteczka/presentation/screens/registration/login_screen.dart';
import 'package:biblioteczka/presentation/screens/profile_Screen.dart';
import 'package:biblioteczka/presentation/screens/registration/registration_screen.dart';

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

      case '/registartionScreen':
        {
          return MaterialPageRoute(builder: (context) => registrationScreen());
        }

      default:
        return MaterialPageRoute(builder: (context) => loginScreen());
    }
  }
}
