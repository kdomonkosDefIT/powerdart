import 'package:test/test.dart';
import 'package:powerdart_v2/src/psd_analysis/cumtrapz.dart';
import 'package:powerdart_v2/src/math/linspace.dart';

import 'utils/truncate.dart';

void main() {
  test('cumulative integration', () {
    var x = linspace(-2, 2, num: 20);
    List<double> y = List.from(x);

    var b = cumtrapz(y, x);
    List<double> bExpected = [
      -3.98891967e-01,
      -7.53462604e-01,
      -1.06371191e+00,
      -1.32963989e+00,
      -1.55124654e+00,
      -1.72853186e+00,
      -1.86149584e+00,
      -1.95013850e+00,
      -1.99445983e+00,
      -1.99445983e+00,
      -1.95013850e+00,
      -1.86149584e+00,
      -1.72853186e+00,
      -1.55124654e+00,
      -1.32963989e+00,
      -1.06371191e+00,
      -7.53462604e-01,
      -3.98891967e-01,
      -2.77555756e-16
    ];

    for (var i = 0; i < b.length; i++) b[i] = truncate(b[i], 4);
    for (var i = 0; i < bExpected.length; i++)
      bExpected[i] = truncate(bExpected[i], 4);

    expect(b, bExpected);
  });

  test('trapz array y and dx', () {
    expect(() => cumtrapz([], [1.0, 2.0]), throwsA(isA<AssertionError>()));
    expect(() => cumtrapz([1.0, 2.0], []), throwsA(isA<AssertionError>()));
    expect(() => cumtrapz([1.0, 2.0], [1.0]), throwsA(isA<AssertionError>()));
  });
}
