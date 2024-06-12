import 'package:test/test.dart';
import 'package:powerdart_v2/src/math/bit_reverse.dart';

void main() {
  test("rotate 00001 3 times and get 00100", () {
    var n = bitReverse(1, 3);
    expect(n, 4);
  });

  test("rotate 0001 1 times and get 0010", () {
    var n = bitReverse(1, 2);
    expect(n, 2);
  });

  test("rotate 00001 5 times and get 10000", () {
    var n = bitReverse(1, 5);
    expect(n, 16);
  });
}
