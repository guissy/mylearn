import 'package:flutter/material.dart';
import 'package:mylearn/abc/getCodeSpan.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {

  GetCodeSpan getCodeSpan = new GetCodeSpan('');

  getSpan(String s) {
    getCodeSpan.spans.clear();
    return getCodeSpan.start(s, 0);
  }

  @override
  Widget build(BuildContext context) {
//    getCodeSpan.start('for i in range(0, 10): \n   pass', 0);
    List<String> code = 'for i in range(0, 10): \n   pass'.split('\n');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 90.0,
            height: MediaQuery
                .of(context)
                .size
                .height - 90.0,
            color: Color(0xfffffbef),
            child: ListView.builder(
                itemCount: code.length,
                itemBuilder: (content, i) =>
                    Container(
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
                  itemBuilder: (content, i) =>
                      Container(
                        height: 55.0,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: RichText(
                          text: TextSpan(
                            text: '',
                            style: TextStyle(
                                color: Colors.black, fontSize: 28.0),
                            children: getSpan(code[i]),
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
