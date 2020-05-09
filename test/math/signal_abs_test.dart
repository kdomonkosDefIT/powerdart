
import 'package:flutter_test/flutter_test.dart';
import 'package:powerdart/src/math/signal_abs.dart';

void main() {
  test("returns the absolute value", () {
    List<double> val = [1.0,-3.0,7.0,-3.0,-57.0,412];
    List<double> expected = [1.0,3.0,7.0,3.0,57.0,412];

    expect(abs(val), equals(expected));
  });

  test("absolute value of an emty list is an empty list", () {
    List<double> val = [];
    List<double> expected = [];

    expect(abs(val), equals(expected));
  });
}