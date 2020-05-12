import 'package:test/test.dart';
import 'package:powerdart/src/psd_analysis/trapz.dart';

void main() {
  test('trapz y and x', () {
    var y = [1.0, 2.0, 3.0];
    var x = [4.0, 6.0, 8.0];
    var i = trapz(y, x);
    var iExpected = 8.0;
    expect(i, iExpected);
  });

  test('trapz array y and dx', () {
    expect(() => trapz([], [1.0, 2.0]), throwsA(isA<AssertionError>()));
    expect(() => trapz([1.0, 2.0], []), throwsA(isA<AssertionError>()));
    expect(() => trapz([1.0, 2.0], [1.0]), throwsA(isA<AssertionError>()));
  });
}
