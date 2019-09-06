import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    List<String> code = 'for i in range(0, 10): \n   pass'.split('\n');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 90.0,
            height: MediaQuery.of(context).size.height - 90.0,
            color: Color(0xfffffbef),
            child: ListView.builder(
                itemCount: code.length,
                itemBuilder: (content, i) => Container(
                      height: 50.0,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        (i + 1).toString(),
                        style:
                            TextStyle(color: Color(0xff975e17), fontSize: 24.0),
                      ),
                    )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 5.0),
              color: Color(0xfffffff5),
              child: ListView.builder(
                  itemCount: code.length,
                  itemBuilder: (content, i) => Container(
                        height: 50.0,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          code[i],
                          style: TextStyle(
                              color: Color(0xff4ca9e9), fontSize: 24.0),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
