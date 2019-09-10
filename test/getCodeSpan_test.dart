import 'package:mylearn/abc/getCodeSpan.dart';
import "package:test/test.dart";

void main() {
  group("字符串", () {
    test("提取字符串: 双引号", () {
      var line1 = "for a in \"Hello World\":";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["\"Hello World\"", 9, 22];
      var actual = getCodeSpan.extractString();
      expect(actual, expected);
    });
    test("提取字符串: 单引号", () {
      var line1 = "for a in \'Hello World\':";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["\'Hello World\'", 9, 22];
      var actual = getCodeSpan.extractString();
      expect(actual, expected);
    });
  });
}
