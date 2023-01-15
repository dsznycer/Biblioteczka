import 'package:biblioteczka/screens/bookshelf_screen.dart';
import 'package:biblioteczka/screens/start_screen.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:biblioteczka/screens/login_screen.dart';
import 'package:biblioteczka/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Biblio(
    router: AppRouter(),
  ));
}

class Biblio extends StatelessWidget {
  Biblio({required this.router, Key? key}) : super(key: key);

  AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
