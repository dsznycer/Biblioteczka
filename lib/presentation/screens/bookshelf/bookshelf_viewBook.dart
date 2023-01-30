import 'package:biblioteczka/business_logic/cubit/settings_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model.dart';

class BookshelfViewBook extends StatelessWidget {
  const BookshelfViewBook({super.key});

  @override
  Widget build(BuildContext context) {
    final Book book = context.watch<SettingsCubit>().state.chosenBook;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(14),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () =>
                        Utils.biblioteczkaNavigator.currentState!.pop(),
                    icon: Icon(Icons.close)),
                Text(
                  'Twoja ksiązka',
                  style: AppTextStyles.H4,
                )
              ],
            ),
            Column(
              children: [Text(book.title)],
            )
          ],
        ),
      ),
    );
  }
}
