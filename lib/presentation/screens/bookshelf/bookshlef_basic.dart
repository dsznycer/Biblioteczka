import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/widgets/book_widget.dart';
import 'package:biblioteczka/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/book_cubit.dart';
import '../../../data/models/book_model.dart';
import '../../widgets/navigation_bar.dart';

class BookShelfBasic extends StatelessWidget {
  const BookShelfBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: SafeArea(
          child: Navigator(
            key: Utils.biblioteczkaNavigator,
            initialRoute: '/',
            onGenerateRoute:
                RepositoryProvider.of<AppRouter>(context).biblioteczkaNavigator,
          ),
        ));
  }
}
