import 'package:biblioteczka/data/APIs/google_books_api.dart';
import 'package:biblioteczka/data/APIs/hapi_books_api.dart';

import 'dart:convert';

import 'package:biblioteczka/data/Models/BookModels/book_model.dart';
import 'package:flutter/material.dart';

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

  // Get best books of previous month
  Future<List<BookApi>> getBooksByMonth() async {
    List<BookApi> listOfBooks = [];
    String month = (DateTime.now().month + 1).toString();
    final year = DateTime.now().year.toString();

    // Check if month have 0 value
    if (int.parse(month) == 0) {
      month = '1';
    }

    final rawData = await _hapiApi.getBestBookOfMonth(year, month);
    final List list = jsonDecode(rawData) as List;
    listOfBooks =
        list.map((e) => BookApi.fromJson(e as Map<String, dynamic>)).toList();

    return listOfBooks;
  }

  // Get book by Book Api ID
  Future<BookApiModel> getBookApiBookByID(String id) async {
    final rawData = await _hapiApi.getInformationByID(id);

    final BookApiModel bookApi =
        BookApiModel.fromJson(jsonDecode(rawData) as Map<String, dynamic>);

    return bookApi;
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
