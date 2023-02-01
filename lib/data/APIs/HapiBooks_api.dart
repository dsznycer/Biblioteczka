import 'dart:convert';

import 'package:biblioteczka/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class HapiBooksApi {
  Map<String, String> header = {
    'X-RapidAPI-Key': '8126a24257msh2be5445c2a3e22bp185016jsn7459ef770822',
    'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
  };

  static const _HapiBooksUrl = 'hapi-books.p.rapidapi.com';

  Future<BookApi> getBook() async {
    var uri = Uri.https(_HapiBooksUrl, 'top/2021');
    var responseBook = await http.get(uri, headers: header);

    if (responseBook.statusCode != 200) {
      print(responseBook.statusCode);
      throw Error();
    }
    var mapa = jsonDecode(responseBook.body) as List;

    var mapek = mapa[0] as Map<String, dynamic>;

    BookApi book = BookApi.fromJson(mapek);

    print(book);

    return book;
  }
}
