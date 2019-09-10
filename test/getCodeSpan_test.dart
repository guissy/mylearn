import 'package:flutter/material.dart';
import 'package:mylearn/abc/getCodeSpan.dart';
import "package:test/test.dart";

void main() {
  group("字符串", () {
    test("提取字符串: 双引号", () {
      var line1 = "for a in \"Hello World\":";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["\"Hello World\"", "for a in ", ":"];
      var actual = getCodeSpan.extractString(line1);
      expect(actual, expected);
    });
    test("提取字符串: 单引号", () {
      var line1 = "for a in \'Hello World\':";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["\'Hello World\'", "for a in ", ":"];
      var actual = getCodeSpan.extractString(line1);
      expect(actual, expected);
    });
  });
  group("分割", () {
    test("分割: 左括号", () {
      var line1 = "foo(a, b):";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["foo", "a, b):"];
      var actual = getCodeSpan.splitBracketLeft(line1);
      expect(actual, expected);
    });
    test("分割: 右括号", () {
      var line1 = "foo(a, b):";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["foo(a, b", ":"];
      var actual = getCodeSpan.splitBracketRight(line1);
      expect(actual, expected);
    });
    test("分割: 逗号", () {
      var line1 = "a, b, c";
      var getCodeSpan = GetCodeSpan(line1);
      var expected = ["a", "b", "c"];
      var actual = getCodeSpan.splitComma(line1);
      expect(actual, expected);
    });
  });
  group("start", () {
    test('for', () {
      var line1 = 'for i in range(10):';
      var getCodeSpan = GetCodeSpan(line1);
      List<TextSpan> spans = getCodeSpan.start(line1, 0);
      var s = "";
      spans.forEach((span) {
        s += span.text;
      });
      expect(line1, s);
    });
  });
}
