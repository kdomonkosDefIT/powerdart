import 'package:test/test.dart';
import 'package:complex/complex.dart';
import 'package:powerdart_v2/src/math/signal_abs.dart';

import '../utils/truncate.dart';

void main() {
  test("magnitude of complex with img 0 equals the abs of the real part", () {
    List<Complex> val = [
      Complex(1.0),
      Complex(-3.0),
      Complex(7.0),
      Complex(-3.0),
      Complex(-57.0),
      Complex(412),
    ];
    List<double> expected = [1.0, 3.0, 7.0, 3.0, 57.0, 412];

    expect(abs(val), equals(expected));
  });

  test("magnitude of complex with real 0 equals the abs of the imaginary part",
      () {
    List<Complex> val = [
      Complex(0, 1.0),
      Complex(0, -3.0),
      Complex(0, 7.0),
      Complex(0, -3.0),
      Complex(0, -57.0),
      Complex(0, 412),
    ];
    List<double> expected = [1.0, 3.0, 7.0, 3.0, 57.0, 412];

    expect(abs(val), equals(expected));
  });

  test("magnitude of complex with real and imaginary part not 0 is correct",
      () {
    List<Complex> val = [
      Complex(1.0, 1.0),
      Complex(-5.0, -3.0),
      Complex(-2.0, 7.0),
      Complex(6.0, -3.0),
      Complex(28.0, -57.0),
      Complex(-210, 412),
    ];
    List<double> expected = [1.4142, 5.8310, 7.2801, 6.7082, 63.5059, 462.4327];

    final absRes = abs(val);
    for (var i = 0; i < absRes.length; i++) {
      expect(truncate(absRes[i], 4), equals(expected[i]));
    }
  });

  test("abs value of an emty list is an empty list", () {
    List<Complex> val = [];
    List<double> expected = [];

    expect(abs(val), equals(expected));
  });
}
