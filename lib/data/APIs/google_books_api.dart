import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleBooksApi {
  static const String apiKey = 'AIzaSyBhEHykC7tKUaVSzriVjnbS3SQPQhPcmlM';
  static const String authorityUrl = 'www.googleapis.com';

  Future<void> getBookWithTitleAuthor() async {
    Map<String, dynamic> queryMap = {
      'q': 'girl with dragon inauthor:Stieg',
      'printType': 'books',
      'projection': 'lite',
      'key': apiKey
    };

    Uri url = Uri.https(authorityUrl, '/books/v1/volumes', queryMap);

    var response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode.toString());
      throw Error();
    }

    var decodedResponse = jsonDecode(response.body);

    print(url);
    print('Response is:');
    print(decodedResponse);
  }

  Future<void> getBookByGoogleId(String id) async {
    Map<String, dynamic> queryMap = {'projection': 'lite', 'key': apiKey};

    Uri url = Uri.https(authorityUrl, '/books/v1/volumes/$id', queryMap);

    var response = await http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode.toString());
      throw Error();
    }

    var decodedResponse = jsonDecode(response.body);

    print(url);
    print('Response is:');
    print(decodedResponse);
  }
}
