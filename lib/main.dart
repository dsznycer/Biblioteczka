import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/APIs/google_books_api.dart';
import 'package:biblioteczka/data/APIs/hapi_books_api.dart';
import 'package:biblioteczka/data/Repositories/book_repository.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:biblioteczka/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(create: (context) => Navig()),
    RepositoryProvider(create: (context) => AppRouter()),
    RepositoryProvider(create: (context) => BookRepository()),
    RepositoryProvider(create: (context) => GoogleBooksApi())
  ], child: const Biblio()));
}

class Biblio extends StatelessWidget {
  const Biblio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookCubit>(
            create: (context) => BookCubit(context.read<BookRepository>())),
        BlocProvider<SettingsCubit>(create: (create) => SettingsCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Utils.mainNavigator,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.notoSerifTextTheme(),
          navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: MaterialStateTextStyle.resolveWith(
                  (states) => TextStyle(color: Colors.blueGrey))),
        ),
        onGenerateRoute:
            RepositoryProvider.of<AppRouter>(context).mainNavigator,
      ),
    );
  }
}
