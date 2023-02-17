import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLine extends StatelessWidget {
  ChooseLine({super.key});

  BookProgress object = BookProgress.inProgress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SegmentedButton(
            segments: const [
              ButtonSegment(
                  value: BookProgress.red,
                  label: Text(
                    'Przeczytane',
                  )),
              ButtonSegment(
                  value: BookProgress.toRead,
                  label: Text(
                    'Chcę przeczytać',
                  )),
              ButtonSegment(
                  value: BookProgress.inProgress,
                  label: Text(
                    'W trakcie',
                  )),
            ],
            selected: {state.bookForm.bookProgress},
            onSelectionChanged: (Set<BookProgress> newSelection) {
              object = newSelection.first;
              context.read<BookCubit>().updateBookFormProgress(object);
            },
          ),
        );
      },
    );
  }
}
