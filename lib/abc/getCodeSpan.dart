part 'py.dart';

class GetCodeSpan {
  String line;

  GetCodeSpan(this.line) {
//    PythonSyntax.functions
  }

  extractString() {
    RegExp strR1 = new RegExp(r"'[^']*'");
    RegExp strR2 = new RegExp(r'"[^"]*"');
    var a = strR1.firstMatch(line) ?? strR2.firstMatch(line);
    return a != null ? [a.group(0), a.start, a.end] : [];
  }
}