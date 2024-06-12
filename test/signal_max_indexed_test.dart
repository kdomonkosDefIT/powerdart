import 'package:test/test.dart';
import 'package:powerdart_v2/src/model/max_indexed_result.dart';
import 'package:powerdart_v2/src/psd_analysis/signal_max_indexed.dart';

void main() {
  test("max indexed", () {
    List<double> input = [
      -3.9,
      7.5,
      0.0 - 1.0,
      1.3,
      1.5,
      -1.7,
      -1.8,
      1.9,
      1.9,
      -1.9,
      1.9,
    ];
    final expected = MaxIndexedResult(7.5, 1);
    expect(maxIndexed(input), expected);
  });

  test("max indexed with one-length input", () {
    expect(maxIndexed([2.0]), MaxIndexedResult(2.0, 0));
  });

  test("max indexed throws an error", () {
    expect(() => maxIndexed([]), throwsA(isA<AssertionError>()));
  });
}
