
import 'package:complex/complex.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:powerdart/src/dft/real_fft.dart';

import 'utils/complexListTruncate.dart';

void main() {
  group("FFT of Real sequence", () {
    test("rfft of a even samples signal", () {
      var x = [1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0];
      var X = rfft(x);
      var expectedX = [
        Complex(4.0, 0.0),
        Complex(1.0, -2.414213562373095),
        Complex(0.0, 0.0),
        Complex(1.0, -0.4142135623730949),
        Complex(0.0, 0.0),
      ];
      var fractionDigits = 8;

      complexListTruncate(X, fractionDigits);
      complexListTruncate(expectedX, fractionDigits);

      expect(X, expectedX);
    });

    test("rfft of a odd samples signal", () {
      var x = [1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0];
      var X = rfft(x);
      var expectedX = [
        Complex(4.0, 0.0),
        Complex(0.5000000000000002, -2.1906431337674115),
        Complex(0.4999999999999999, 0.24078730940376425),
        Complex(0.5000000000000002, -0.6269801688313521),
      ];
      var fractionDigits = 8;

      complexListTruncate(X, fractionDigits);
      complexListTruncate(expectedX, fractionDigits);

      expect(X, expectedX);
    });
  });
}