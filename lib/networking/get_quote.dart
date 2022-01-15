import 'dart:convert';

import 'package:http/http.dart' as http;

class GetQuote {
  static Future<List<String>> getQuote() async {
    const String _URL = "http://api.quotable.io/random";
    String _author = "";
    String _content = "";
    await http.get(Uri.parse(_URL)).then(
        (http.Response r) {
          _content = jsonDecode(r.body)["content"];
          _author = jsonDecode(r.body)["author"];
        }
    );
    List<String> _list = [];
    _list.add(_author);
    _list.add(_content);
    print(_list);
    return _list;
  }
}