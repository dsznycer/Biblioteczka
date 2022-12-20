import 'package:biblioteczka/presentation/screens/bookshelfScreen.dart';
import 'package:biblioteczka/presentation/screens/startScreen.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:biblioteczka/presentation/screens/loginScreen.dart';
import 'package:biblioteczka/presentation/screens/registrationScreen.dart';
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
      initialRoute: 'loginScreen',
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
