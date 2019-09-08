import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {

  getCodeWords(String str) {
    const keywords = [
      "def",
      "if",
      "raise",
      "None",
      "del",
      "import",
      "return",
      "elif",
      "in",
      "try",
      "and",
      "else",
      "is",
      "while",
      "as",
      "except",
      "lambda",
      "with",
      "assert",
      "finally",
      "nonlocal",
      "yield",
      "break",
      "for",
      "not",
      "class",
      "from",
      "or",
      "continue",
      "global",
      "pass"
    ];
    List<String> s = str.split(' ');
    List<TextSpan> widgets = [];
    RegExp isNumber = new RegExp(r"^(\d)*\.?(\d)*$");
    RegExp isString = new RegExp(r"^'.+'$");
    RegExp isString2 = new RegExp(r'^".+"$');
    List<String> functions = [
      "abs",
      "all",
      "any",
      "ascii",
      "bin",
      "bool",
      "bytearary",
      "bytes",
      "callable",
      "chr",
      "ord",
      "complex",
      "delattr",
      "dict",
      "dir",
      "divmod",
      "enumerate",
      "eval",
      "exec",
      "filter",
      "float",
      "format",
      "globals",
      "getattr",
      "hasattr",
      "hash",
      "help",
      "hex",
      "id",
      "input",
      "int",
      "isinstance",
      "issubclass",
      "iter",
      "len",
      "list",
      "local",
      "map",
      "max",
      "min",
      "next",
      "oct",
      "ord",
      "pow",
      "print",
      "range",
      "reper",
      "reversed",
      "round",
      "set",
      "setattr",
      "slice",
      "str",
      "sorted",
      "sum",
      "super",
      "tuple",
      "type",
      "vars",
      "zip"
    ];
    s.forEach((e) {
      if (keywords.contains(e)) {
        widgets.add(TextSpan(text: e, style: TextStyle(color: Color(0xff4ca9e9))));
      } else if (isNumber.hasMatch(e)) {
        widgets.add(TextSpan(text: e, style: TextStyle(color: Color(0xff8679d5))));
      } else if (isString.hasMatch(e) || isString2.hasMatch(e)) {
        widgets.add(TextSpan(text: e, style: TextStyle(color: Color(0xff1dab51))));
      } else if (e == 'True' || e == 'False') {
        widgets.add(TextSpan(text: e, style: TextStyle(color: Color(0xffb58267))));
      } else if (functions.contains(e.split('(')[0])) {
        String world = e.split('(')[0];
        String other = e.split('(').sublist(1).join('(');
        widgets.add(TextSpan(text: world, style: TextStyle(color: Color(0xffff4e4a))));
        widgets.add(TextSpan(text: '('+other, style: TextStyle(color: Color(0xff3d3c3c))));
      } else {
        print(e);
        widgets.add(TextSpan(text: e, style: TextStyle(color: Color(0xff3d3c3c))));
      }
      widgets.add(TextSpan(text: ' '));
    });
    return widgets;
  }

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
                            children: getCodeWords(code[i]),
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
