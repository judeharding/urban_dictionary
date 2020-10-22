class Term {
  // initializer
  Term({this.word, this.definition, this.likes, this.dislikes});

  String word;
  String definition;
  int likes;
  int dislikes;

  // working with flutter_html dependency to mark up
  // the definitions with brackets
  String get htmlDefinition {
    return definition.replaceAll('[', '<b>').replaceAll(']', '</b>');
  }

  // declaring fromJson from the define_term_response.dart
  Term.fromJson(Map<String, dynamic> json)

      // these keys are coming from the https://rapidapi.com/community/api/urban-dictionary endpoint
      // maping to word, def, like, dislike
      : word = json['word'],
        definition = json['definition'],
        likes = json['thumbs_up'],
        dislikes = json['thumbs_down'];
}
