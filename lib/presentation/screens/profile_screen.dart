import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: RepositoryProvider.of<Navig>(context),
        body: Center(
          child: Container(
            child: Text('Profile site'),
          ),
        ));
  }
}
