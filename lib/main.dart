import 'package:biblioteczka/bookshelf/bookshelfScreen.dart';
import 'package:biblioteczka/startScreen/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:biblioteczka/loginScreen/loginScreen.dart';
import 'package:biblioteczka/registrationScreen/registrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Biblio());
}

class Biblio extends StatelessWidget {
  const Biblio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'loginScreen',
      routes: {
        '/': (BuildContext context) => startScreen(),
        'loginScreen': (BuildContext context) => loginScreen(),
        'registrationScreen': (BuildContext context) => registrationScreen(),
        'bookshelfScreen': (BuildContext context) => bookShelf(),
      },
    );
  }
}
