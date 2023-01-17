import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Navig()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BookCubit>(
            create: (context) => BookCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.onGenerateRoute,
        ),
      ),
    );
  }
}
