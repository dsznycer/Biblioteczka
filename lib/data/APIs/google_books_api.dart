import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleBooksApi {
  static const String apiKey = 'AIzaSyBhEHykC7tKUaVSzriVjnbS3SQPQhPcmlM';
  static const String authorityUrl = 'www.googleapis.com';

  // Method to search books with specific title and author
  Future<String> getBooksWithTitle(String text) async {
    Map<String, dynamic> queryMap = {
      'q': text,
      'printType': 'books',
      'maxResult': '14',
      'key': apiKey
    };

    Uri url = Uri.https(authorityUrl, '/books/v1/volumes', queryMap);

    var response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode.toString());
      throw Error();
    }

    return response.body;
  }

  // Method to get function by specific google ID
  Future<String> getBookByGoogleId(String id) async {
    Map<String, dynamic> queryMap = {'projection': 'lite', 'key': apiKey};

    Uri url = Uri.https(authorityUrl, '/books/v1/volumes/$id', queryMap);

    var response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode.toString());
      throw Error();
    }

    return response.body;
  }
}
