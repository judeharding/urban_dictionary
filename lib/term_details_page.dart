import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//
import 'package:urban_dictionary/term.dart';

class TermDetailsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermDetailsPage');

  //initializer
  TermDetailsPage({Key key, this.term}) : super(key: key);
  final Term term;

  Widget termDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(data: term.htmlDefinition),
        Spacer(),
        Row(
          children: [
            Text('Likes:  ${term.likes}'),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('Dislikes: ${term.dislikes}'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.word),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: termDetails(),
      ),
    );
  }
}
