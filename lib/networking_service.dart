import 'dart:convert';
import 'package:http/http.dart' as http;
//
import 'package:urban_dictionary/define_term_response.dart';
import 'package:urban_dictionary/term.dart';

class NetworkingService {
  Future<List<Term>> defineTerm(String searchTerm) async {
    // defining a dictionary object
    final queryParameters = {'term': searchTerm};
    final uri = Uri.https('mashape-community-urban-dictionary.p.rapidapi.com',
        'define', queryParameters);
    final headers = {
      "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com",
      "x-rapidapi-key": ""
    };
    final response = await http.get(uri, headers: headers);
    // considered a FUTURE list of terms
    if (response.statusCode == 200) {
      // should get a dictionary object with 1 key = a list array of object terms
      final decodedBody = jsonDecode(response.body);
      final defineTermsResponse = DefineTermResponse.fromJson(decodedBody);
      return defineTermsResponse.list;
    } else {
      throw Exception('Failed to define term');
    }
  }
}
