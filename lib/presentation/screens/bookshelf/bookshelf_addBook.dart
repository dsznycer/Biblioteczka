import 'package:biblioteczka/business_logic/cubit/book_cubit.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:biblioteczka/presentation/styles/app_colors.dart';
import 'package:biblioteczka/presentation/styles/app_icons.dart';
import 'package:biblioteczka/presentation/styles/app_text_style.dart';
import 'package:biblioteczka/presentation/widgets/textInput_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/Models/book_model.dart';

class BookAdd extends StatelessWidget {
  BookAdd({super.key});

  String title = '';
  String author = '';
  String pages = '0';
  String yearOfEnd = '0';
  int score = 3;
  List<String> notes = const [];
  BookProgress _bookProgress = BookProgress.toRead;

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerAuthor = TextEditingController();
  TextEditingController controllerPages = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: AppColors.kCol4,
          borderRadius: BorderRadius.circular(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: (() =>
                        Utils.biblioteczkaNavigator.currentState!.pop()),
                    icon: const Icon(Icons.close),
                    iconSize: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Dodaj książkę',
                    style: AppTextStyles.H3,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AppTextInput(
                          controller: controllerTitle,
                          hintText: 'Tytuł',
                          iconData: BiblioteczkaIcons.bookIcon,
                        ),
                        AppTextInput(
                          controller: controllerAuthor,
                          hintText: 'Autor',
                          iconData: BiblioteczkaIcons.quoteIcon,
                        ),
                        // AppTextInput(
                        //     hintText: 'Ilość stron',
                        //     iconData: BiblioteczkaIcons.pagesIcon,
                        //     labelValue: pages),
                        // AppTextInput(
                        //     hintText: 'Rok ukończenia',
                        //     iconData: BiblioteczkaIcons.calendarIcon,
                        //     labelValue: author),
                        ChooseLine(object: _bookProgress),
                        FloatingActionButton.small(
                            onPressed: () =>
                                print(_bookProgress.toString() + yearOfEnd)),
                        const SizedBox(height: 20),
                        FloatingActionButton.extended(
                          backgroundColor: AppColors.kCol3,
                          focusColor: AppColors.kCol2,
                          onPressed: () {
                            context.read<BookCubit>().addNewBook(Book(
                                author: author,
                                title: controllerTitle.text,
                                score: score,
                                pages: pages,
                                yearOfEnd: yearOfEnd,
                                notes: notes));
                            controllerAuthor.dispose();
                            Utils.biblioteczkaNavigator.currentState!.pop();
                          },
                          label: Text('Dodaj do biblioteczki'),
                          icon: Icon(BiblioteczkaIcons.addIcon),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: refactore it to separated class
class ChooseLine extends StatefulWidget {
  ChooseLine({required this.object, super.key});

  BookProgress object;

  @override
  State<ChooseLine> createState() => _ChooseLineState();
}

class _ChooseLineState extends State<ChooseLine> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const [
        ButtonSegment(value: BookProgress.red, label: Text('Przeczytane')),
        ButtonSegment(
            value: BookProgress.toRead, label: Text('Chcę przeczytać')),
        ButtonSegment(value: BookProgress.inprogress, label: Text('W trakcie')),
      ],
      selected: {widget.object},
      onSelectionChanged: (Set<BookProgress> newSelection) {
        setState(() {
          widget.object = newSelection.first;
        });
      },
    );
  }
}
