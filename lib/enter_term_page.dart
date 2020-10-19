import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';

class EnterTermPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EnterTermPageState();
}

// PRIVATE class that creates a state for the statefull widget above
class _EnterTermPageState extends State<EnterTermPage> {
// FIELD DATA FOR SEARCH FORM
  final _textFieldController = TextEditingController();

// SEARCH FUNCTION
  void _search() {
    print(_textFieldController.text);
  }

//SEARCH FORM
  Widget searchForm() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter Term'),
            ),
            FlatButton(
              onPressed: () {
                _search();
              },
              color: Colors.purple,
              textColor: Colors.white,
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urban Dictionary'),
      ),
      body: searchForm(),
    );
  }
}
