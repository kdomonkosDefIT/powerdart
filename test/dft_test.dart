
import 'package:complex/complex.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:powerdart/src/dft/dft.dart';

import 'utils/truncate.dart';

void main() {
  group("DFT of Complex sequence", () {
    test("dft of a even samples signal", () {
      var x = [
        Complex(1.0),
        Complex(1.0),
        Complex(1.0),
        Complex(1.0),
        Complex(0.0),
        Complex(0.0),
        Complex(0.0),
        Complex(0.0),
      ];
      var X = dft(x);
      var expectedX = [
        Complex(4.0, 0.0),
        Complex(1.0, -2.41421356),
        Complex(0.0, 0.0),
        Complex(1.0, -0.41421356),
        Complex(0.0, 0.0),
        Complex(1.0, 0.41421356),
        Complex(0.0, 0.0),
        Complex(1.0, 2.41421356)
      ];

      var fractionDigits = 8;
      for (var i = 0; i < X.length; i++) {
        expect(truncate(X[i].real, fractionDigits),
          truncate(expectedX[i].real, fractionDigits));
        expect(truncate(X[i].imaginary, fractionDigits),
          truncate(expectedX[i].imaginary, fractionDigits));
      }
    });

    test("dft of a odd samples signal", () {
      var x = [
        Complex(1.0),
        Complex(1.0),
        Complex(1.0),
        Complex(1.0),
        Complex(0.0),
        Complex(0.0),
        Complex(0.0),
      ];
      var X = dft(x);
      var expectedX = [
        Complex(4.0, 0.0),
        Complex(0.5, -2.19064313),
        Complex(0.5, 0.24078731),
        Complex(0.5, -0.62698017),
        Complex(0.5, 0.62698017),
        Complex(0.5, -0.24078731),
        Complex(0.5, 2.19064313)
      ];

      var fractionDigits = 8;
      for (var i = 0; i < X.length; i++) {
        expect(truncate(X[i].real, fractionDigits),
          truncate(expectedX[i].real, fractionDigits));
        expect(truncate(X[i].imaginary, fractionDigits),
          truncate(expectedX[i].imaginary, fractionDigits));
      }
    });
  });
}