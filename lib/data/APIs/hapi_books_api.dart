import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HapiBooksApi {
  Map<String, String> header = {
    'X-RapidAPI-Key': '8126a24257msh2be5445c2a3e22bp185016jsn7459ef770822',
    'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
  };
  static const _hapiBooksUrl = 'hapi-books.p.rapidapi.com';

  final Logger _logger = Logger();

  // Method to get best books of specific year
  Future<String> getBestBooks(String year) async {
    var uri = Uri.https(_hapiBooksUrl, 'top/$year');

    http.Response responseBook = await http.get(uri, headers: header);

    if (responseBook.statusCode != 200) {
      _logger.v("Response status code is: ${responseBook.statusCode}");
      throw Error();
    } else {
      _logger.e('Succeded downloaded data with HapiBookApi');
    }
    return responseBook.body;
  }

  // Method to get best book of month
  Future<String> getBestBookOfMonth(String year, String month) async {
    var uri = Uri.https(_hapiBooksUrl, 'month/$year/$month');

    http.Response responseBook = await http.get(uri, headers: header);

    if (responseBook.statusCode != 200) {
      _logger.e('Response status code is: ${responseBook.statusCode}');
      throw Error();
    } else {
      _logger.v('Succeded downloaded data with HapiBookApi');
    }

    return responseBook.body;
  }

  // Method to get book by ID
  Future<String> getInformationByID(String id) async {
    var uri = Uri.https(_hapiBooksUrl, '/book/$id');

    http.Response responseBook = await http.get(uri, headers: header);

    if (responseBook.statusCode != 200) {
      _logger.e('Response status code is: ${responseBook.statusCode}');
      throw Error();
    } else {
      _logger.v('Succeded downloaded data with HapiBookApi');
    }

    return responseBook.body;
  }
}
