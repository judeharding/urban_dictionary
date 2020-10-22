import 'term.dart';

//defining a list of terms
class DefineTermResponse {
  //initializer
  DefineTermResponse({this.list});

  List<Term> list;
  //factory = convenience init?
  factory DefineTermResponse.fromJson(Map<String, dynamic> json) {
    // checking for list data
    if (json['list'] is List) {
      // casting json as a list of objects
      final list = json['list'] as List;
      //casting list as map objects
      final objectsList = list.cast<Map<String, dynamic>>();
      //maping the list from/to term.dart
      final termsList = objectsList.map((e) => Term.fromJson(e));

      // termsList is an iterable so we have to convert it .toList
      return DefineTermResponse(list: termsList.toList());
    } else {
      throw Exception('No List in Response');
    }
  }
}
