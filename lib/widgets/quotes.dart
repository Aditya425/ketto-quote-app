import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote/networking/get_quote.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  String _author = "";
  String _content = "";

  @override
  void initState() {
    super.initState();
    _getQuote();
  }
  Future<void> _getQuote() async{
    List<String> list = await GetQuote.getQuote();
    setState(() {
      _author = list[0];
      _content = list[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh
            ),
            onPressed: () {
              _getQuote();
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "$_content",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _author.isEmpty ? "" : "~ $_author",
                        style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
