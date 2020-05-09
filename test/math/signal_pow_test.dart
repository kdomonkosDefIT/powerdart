
import 'package:flutter_test/flutter_test.dart';
import 'package:powerdart/src/math/signal_pow.dart';

void main() {
  test("elevate the signal to power 2", () {
    List<double> val = [1.0,2.0,3.0,4.0,5.0,6.0];
    List<double> expected = [1.0,4.0,9.0,16.0,25.0,36.0];

    expect(pow(val, 2), expected);
  });

  test("elevate the signal to power 3", () {
    List<double> val = [1.0,2.0,3.0,4.0,5.0,6.0];
    List<double> expected = [1.0,8.0,27.0,64.0,125.0,216.0];

    expect(pow(val, 3), expected);
  });

  test("power 2 of and empty signal is empty", () {
    List<double> val = [];
    List<double> expected = [];

    expect(pow(val, 2), expected);
  });
}