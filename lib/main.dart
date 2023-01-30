import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Navig()),
        RepositoryProvider(create: (context) => AppRouter())
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<BookCubit>(create: (context) => BookCubit()),
        BlocProvider<SettingsCubit>(create: (create) => SettingsCubit())
      ], child: Biblio())));
}

class Biblio extends StatelessWidget {
  const Biblio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Utils.mainNavigator,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSerifTextTheme(),
        navigationBarTheme: NavigationBarThemeData(),
      ),
      onGenerateRoute: RepositoryProvider.of<AppRouter>(context).mainNavigator,
    );
  }
}
