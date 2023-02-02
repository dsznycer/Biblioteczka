import 'package:biblioteczka/data/APIs/HapiBooks_api.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'dart:convert';

class BookRepository {
  final HapiBooksApi _hapiApi = HapiBooksApi();

  Future<List<BookApi>> getBestBooksYear(String year) async {
    List<BookApi> listOfBooks = [];

    final rawData = await _hapiApi.getBestBooks(year);

    final List lista = jsonDecode(rawData) as List;

    listOfBooks =
        lista.map((e) => BookApi.fromJson(e as Map<String, dynamic>)).toList();

    return listOfBooks;
  }
}
