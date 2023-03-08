import 'package:biblioteczka/business_logic/bloc/statistic_bloc.dart';
import 'package:biblioteczka/business_logic/cubit/auth_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/Repositories/authentication_repository.dart';
import 'package:biblioteczka/data/Repositories/book_repository.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
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
    RepositoryProvider(create: (context) => AuthenticationRepository()),
  ], child: const Biblio()));
}

class Biblio extends StatelessWidget {
  const Biblio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookCubit>(
            create: (context) =>
                BookCubit(bookRepository: context.read<BookRepository>())),
        BlocProvider<SettingsCubit>(create: (create) => SettingsCubit()),
        BlocProvider<AuthCubit>(
            create: (create) => AuthCubit(
                authRepository: context.read<AuthenticationRepository>())),
        BlocProvider<StatisticBloc>(create: (create) => StatisticBloc())
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.authState != AuthStatus.authenticated) {
            Utils.mainNavigator.currentState!.pushReplacementNamed('/login');
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Utils.mainNavigator,
          theme: ThemeData(
            useMaterial3: true,
            // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kCol3),
            textTheme: GoogleFonts.notoSerifTextTheme(),
            navigationBarTheme: NavigationBarThemeData(
                labelTextStyle: MaterialStateTextStyle.resolveWith((states) =>
                    TextStyle(color: AppColors.kCol2.withOpacity(0.5)))),
          ),
          onGenerateRoute:
              RepositoryProvider.of<AppRouter>(context).mainNavigator,
        ),
      ),
    );
  }
}
