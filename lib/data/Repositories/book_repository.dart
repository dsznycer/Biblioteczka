import 'package:biblioteczka/data/APIs/google_books_api.dart';
import 'package:biblioteczka/data/APIs/hapi_books_api.dart';

import 'dart:convert';

import 'package:biblioteczka/data/Models/book_model.dart';

class BookRepository {
  final RegExp basicRegExp = RegExp(r'[A-Za-z0-9]');
  final HapiBooksApi _hapiApi = HapiBooksApi();
  final GoogleBooksApi _googleBooksApi = GoogleBooksApi();

  // Get HapiBooks best boks of given year
  Future<List<BookApi>> getBestBooksYear(String year) async {
    List<BookApi> listOfBooks = [];

    final rawData = await _hapiApi.getBestBooks(year);

    final List lista = jsonDecode(rawData) as List;

    listOfBooks =
        lista.map((e) => BookApi.fromJson(e as Map<String, dynamic>)).toList();

    return listOfBooks;
  }

// Get Google Boks by title
  Future<List<GoogleBookItem>> searchGoogleBooks(String title) async {
    List<GoogleBookItem> listOfBooksGoogle = [];

    if (!title.contains(basicRegExp)) {
      return listOfBooksGoogle;
    }

    final String rawData = await _googleBooksApi.getBooksWithTitle(title);

    final Map repsonseMap = jsonDecode(rawData) as Map<String, dynamic>;

    final List list = repsonseMap['items'] as List;

    listOfBooksGoogle = list
        .map((e) => GoogleBookItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return listOfBooksGoogle;
  }
}
