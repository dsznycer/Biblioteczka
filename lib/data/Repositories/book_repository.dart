import 'package:biblioteczka/data/APIs/google_books_api.dart';
import 'package:biblioteczka/data/APIs/hapi_books_api.dart';

import 'dart:convert';

import 'package:biblioteczka/data/Models/book_model.dart';

class BookRepository {
  final HapiBooksApi _hapiApi = HapiBooksApi();
  final GoogleBooksApi _googleBooksApi = GoogleBooksApi();

  Future<List<BookApi>> getBestBooksYear(String year) async {
    List<BookApi> listOfBooks = [];

    final rawData = await _hapiApi.getBestBooks(year);

    final List lista = jsonDecode(rawData) as List;

    listOfBooks =
        lista.map((e) => BookApi.fromJson(e as Map<String, dynamic>)).toList();

    return listOfBooks;
  }

  Future<List<GoogleBookItem>> searchGoogleBooks(String title) async {
    List<GoogleBookItem> listOfBooksGoogle = [];

    final String rawData = await _googleBooksApi.getBooksWithTitle(title);

    final Map repsonseMap = jsonDecode(rawData) as Map<String, dynamic>;

    final List list = repsonseMap['items'] as List;

    listOfBooksGoogle = list
        .map((e) => GoogleBookItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return listOfBooksGoogle;
  }
}
