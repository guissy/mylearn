import 'package:flutter/material.dart';

part 'py.dart';

class GetCodeSpan {
  String line;
  List<TextSpan> spans = new List();

  GetCodeSpan(this.line) {
//    start(this.line, 0);
  }

  start(String str, int index) {
    if (str.trim() != '') {
      List<dynamic> strs = extractString(str);
      if (strs.length > 0) {
        var n = index + 1;
        if (strs[1].toString().trim() == '') {
          n = index;
        }
        var el =
            TextSpan(text: strs[0], style: TextStyle(color: Color(0xff1dab51)));
        spans.insert(n, el);
        start(strs[2], index + 2);
        start(strs[1], index);
      } else {
        if (!splitBracketLeft(str, index)) {
          if (!splitBracketRight(str, index)) {
            if (!splitComma(str, index)) {
              if (!splitSpace(str, index)) {
                renderWord(str, index);
              }
            }
          }
        }
      }
    }
    return spans;
  }

  renderWord(str, index) {
    RegExp isNumber = new RegExp(r"^(\d)*\.?(\d)*$");
    RegExp isComment = new RegExp(r'^#.+');
    RegExp isBool = new RegExp(r'^(True|False)$');
    if (PythonSyntax.keywords.contains(str)) {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xff4ca9e9))));
    } else if (PythonSyntax.functions.contains(str)) {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xffff4e4a))));
    } else if (PythonSyntax.functions.contains(str)) {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xffff4e4a))));
    } else if (isNumber.hasMatch(str)) {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xff8679d5))));
    } else if (isBool.hasMatch(str)) {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xffb58267))));
    } else if (isComment.hasMatch(str)) {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xffff9d00))));
    } else {
      spans.insert(index,
          TextSpan(text: str, style: TextStyle(color: Color(0xff3d3c3c))));
    }
  }

  // 括号/逗号/空格
  splitBracketLeft(String str, int index) {
    var pattern = new RegExp(r"\s*\(\s*");
    var strs = str.split(pattern);
    if (strs.length > 1) {
      start(strs[1], index);
      spans.insert(index,
          TextSpan(text: '(', style: TextStyle(color: Color(0xff3d3c3c))));
      start(strs[0], index);
      return true;
    } else {
      return false;
    }
  }

  splitBracketRight(String str, int index) {
    var pattern = new RegExp(r"\s*\)\s*");
    var strs = str.split(pattern);
    if (strs.length > 1) {
      start(strs[1], index);
      spans.insert(index,
          TextSpan(text: ')', style: TextStyle(color: Color(0xff3d3c3c))));
      start(strs[0], index);
      return true;
    } else {
      return false;
    }
  }

  splitComma(String str, int index) {
    var pattern = new RegExp(r"\s*\,\s*");
    var strs = str.split(pattern);
    if (strs.length > 1) {
      start(strs[1], index);
      spans.insert(index,
          TextSpan(text: ',', style: TextStyle(color: Color(0xff3d3c3c))));
      start(strs[0], index);
      return true;
    } else {
      return false;
    }
  }

  splitSpace(String str, int index) {
    var pattern = new RegExp(r"\s+");
    var strs = str.split(pattern);
    if (strs.length > 1) {
      var i = 0;
      strs.reversed.forEach((str) {
        i += 1;
        start(str, index);
        if (i < strs.length) {
          spans.insert(index,
              TextSpan(text: ' ', style: TextStyle(color: Color(0xff3d3c3c))));
        }
      });
      return true;
    } else {
      return false;
    }
  }

  extractString(String str) {
    RegExp strR1 = new RegExp(r"'[^']*'");
    RegExp strR2 = new RegExp(r'"[^"]*"');
    var a = strR1.firstMatch(line) ?? strR2.firstMatch(line);
    return a != null
        ? [a.group(0), str.substring(0, a.start), str.substring(a.end)]
        : [];
  }
}
