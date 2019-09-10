part 'py.dart';

class GetCodeSpan {

  GetCodeSpan(String line) {
//    PythonSyntax.functions
  }

  extractString(line) {
    RegExp strR1 = new RegExp(r"'.+'");
    RegExp strR2 = new RegExp(r'".+"');
    var a = strR1.firstMatch(line) ?? strR2.firstMatch(line);
    return a;
  }
}