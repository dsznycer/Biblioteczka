import 'package:http/http.dart' as http;

class HapiBooksApi {
  Map<String, String> header = {
    'X-RapidAPI-Key': '8126a24257msh2be5445c2a3e22bp185016jsn7459ef770822',
    'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com',
  };
  static const _hapiBooksUrl = 'hapi-books.p.rapidapi.com';

  // Method to get best books of specific year
  Future<String> getBestBooks(String year) async {
    var uri = Uri.https(_hapiBooksUrl, 'top/$year');

    http.Response responseBook = await http.get(uri, headers: header);

    if (responseBook.statusCode != 200) {
      print("Response status code is: ${responseBook.statusCode}");
      throw Error();
    } else {
      print('succeded downloaded data with HapiBookApi');
    }

    print(responseBook.body);

    return responseBook.body;
  }
}
