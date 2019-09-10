import 'package:mylearn/abc/getCodeSpan.dart';
import "package:test/test.dart";
// Import the test package

int Add(int x,int y) {
  return x+y;
}
void main() {
  // Define the test
  test("test to check add method",(){
    // Arrange
    var expected = "流动性比利润更重要";
    var line = "for a in \"流动性比利润更重要\":";
    var getCodeSpan = GetCodeSpan(line);
    // Act
    var actual = getCodeSpan.extractString(line);

    // Asset
    expect(actual,expected);
  });
}

